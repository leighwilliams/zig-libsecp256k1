# Zig libsecp256k1 wrapper

Zig wrapper for `libsecp256k1` c lib.

## Integrating

In the build.zig.zon file, add the following to the dependencies object.

```zig
 .libsecp256k1 = .{
    .url = "https://github.com/Raiden1411/zig-libsecp256k1/archive/VERSION_NUMBER.tar.gz",
}   
```

The compiler will produce a hash mismatch error, add the .hash field to build.zig.zon with the hash the compiler tells you it found.

Then in your build.zig file add the following to the exe section for the executable where you wish to have ZAbi available.

```zig
const zabi_module = b.dependency("zabi", .{}).module("zabi");
// for exe, lib, tests, etc.
exe.root_module.addImport("zabi", zabi_module);
```

Now in the code, you can import components like this:

```zig
const z_libsecp256k1 = @import("zig-libsecp256k1");
```
