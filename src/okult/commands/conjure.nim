import cligen

proc conjure() =
  echo "hello world!"

dispatchGen(conjure, cmdName = "conjure", dispatchName = "dispatchConjure")

proc run*(args: seq[string]): int =
  try:
    dispatchConjure(args)
    0
  except HelpOnly, VersionOnly:
    0
  except ParseError:
    1
