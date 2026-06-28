# Package

version       = "0.1.0"
author        = "Illud Automaton"
description   = "A new awesome nimble package"
license       = "GPL-3.0-or-later"
srcDir        = "src"
binDir        = "bin"
bin           = @["okvlt"]


# Dependencies

requires "nim >= 2.2.10"
requires "cligen"

taskRequires "fmt", "nph"

task build, "build":
  exec "nim c -o:bin/okvlt src/okvlt.nim"

task fmt, "format the codebase":
  exec "nph src"

task lint, "check code style":
  exec "nim check --styleCheck:error --hints:off src/okvlt"
