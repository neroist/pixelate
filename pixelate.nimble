# Package

author        = "Jasmine"
description   = "A CLI to pixelate images"
version       = "0.1.0"
license       = "0BSD"
srcDir        = "src"
bin           = @["pixelate"]


# Dependencies

requires "nim >= 1.6.0"
requires "spinny"
requires "cligen"
requires "pixie"
