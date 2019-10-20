import strutils

type
  Numbers = 1 .. 100

proc printAbbr*(msg: string) =
  if msg.len() > 10:
    echo msg[0] & $(msg.len() - 2) & msg[^1]
  else:
    echo msg

when isMainModule:
  let n: Numbers = parseUint(readLine(stdin))

  for i in countUp(1, n):
    printAbbr(readLine(stdin))
