# Package

version       = "0.1.0"
author        = "Fillipe Meireles"
description   = "Nim Directory Buster"
license       = "MIT"
srcDir        = "src"
binDir        =   "bin"
bin           = @["nbuster"]

# Dependencies

requires "nim >= 2.0.4"
requires "unittest2"