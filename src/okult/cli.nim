import std/os
import commands/conjure

const okultVersion {.strdefine: "NimblePkgVersion".} = "dev"

const usageText = """
okvlt - blablabla

Usage:
  okvlt <command> [arguments]

Command:
  conjure                  tbd
  solve                    tbd
  coagula                  tbd

  okvlt <command> --help   show detailed command help
"""

proc version(f: File = stdout) =
  f.writeLine "okvlt " & okultVersion

proc usage(f: File = stdout) =
  f.write(usageText)

# okult cli entrypoint
proc main*() =
  let params = commandLineParams()

  if params.len == 0:
    usage(stderr)
    quit(1)

  if params[0] in ["-V", "--version"]:
    version(stdout)
    quit(0)

  if params[0] in ["-h", "--help"]:
    usage(stdout)
    quit(0)

  let cmd = params[0]
  let rest = params[1 ..^ 1]

  case cmd
  of "conjure":
    quit(conjure.run(rest))
  else:
    stderr.writeLine "okutl :: command does not exist: " & cmd
    quit(2)
