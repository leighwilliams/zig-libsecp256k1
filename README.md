# Zig libsecp256k1 wrapper

Zig wrapper for `libsecp256k1` c lib.

## Integrating

In the build.zig.zon file, add the following to the dependencies object.

```zig
 .zig_libsecp256k1 = .{
    .url = "https://github.com/leighwilliams/zig-libsecp256k1/archive/VERSION_NUMBER.tar.gz",
}
```

or

```zig
 .zig_libsecp256k1 = .{
    .url = "https://github.com/leighwilliams/zig-libsecp256k1/archive/main.tar.gz",
}   
```


The compiler will produce a hash mismatch error, add the .hash field to build.zig.zon with the hash the compiler tells you it found.

Then in your build.zig file add the following to the exe section for the executable where you wish to use zig_libsecp256k1.

```zig
const zig_libsecp256k1_module = b.dependency("zig_libsecp256k1", .{}).module("zig_libsecp256k1");
// for exe, lib, tests, etc.
exe.root_module.addImport("zig_libsecp256k1", zig_libsecp256k1_module);
```

Now in the code, you can import components like this:

```zig
const z_libsecp256k1 = @import("zig_libsecp256k1");
```
