# Package

version       = "0.1.0"
author        = "Dmitry Chekir"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"

bin = @["tweeter"]
skipExt = @["nim"]

# Dependencies

requires "nim >= 1.0.0", "jester >= 0.4.3"
