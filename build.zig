const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Create the main module
    const module = b.addModule("zig_libsecp256k1", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Get the upstream secp256k1 dependency
    const upstream = b.dependency("secp256k1", .{});

    // Add include paths to the module
    module.addIncludePath(upstream.path("src"));
    module.addIncludePath(upstream.path("include"));
    module.addIncludePath(upstream.path("."));

    // Add C source files to the module
    const flags = &[_][]const u8{ "-DENABLE_MODULE_RECOVERY=1", "-DENABLE_MODULE_EXTRAKEYS=1", "-DENABLE_MODULE_SCHNORRSIG=1" };
    module.addCSourceFiles(.{ .root = upstream.path("."), .flags = flags, .files = &.{ "src/secp256k1.c", "src/precomputed_ecmult.c", "src/precomputed_ecmult_gen.c" } });

    // Add C macros
    module.addCMacro("USE_FIELD_10X26", "1");
    module.addCMacro("USE_SCALAR_8X32", "1");
    module.addCMacro("USE_ENDOMORPHISM", "1");
    module.addCMacro("USE_NUM_NONE", "1");
    module.addCMacro("USE_FIELD_INV_BUILTIN", "1");
    module.addCMacro("USE_SCALAR_INV_BUILTIN", "1");

    // Link C library
    module.linkSystemLibrary("c", .{});

    if (target.query.isNative()) {
        const test_exe = b.addTest(.{
            .name = "test",
            .root_module = module,
        });

        const tests_run = b.addRunArtifact(test_exe);
        const test_step = b.step("test", "Run tests");
        test_step.dependOn(&tests_run.step);

        b.installArtifact(test_exe);
    }
}
