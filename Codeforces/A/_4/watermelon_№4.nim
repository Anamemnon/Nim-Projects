import strutils
type
  Numbers = 1 .. 100

proc watermelon* (n: Numbers): string = 
  if n > 3 and n mod 2 == 0:
    "YES"
  else:
    "NO"

when isMainModule:
  let n: Numbers = parseUInt(readLine(stdin))
  echo watermelon(n)
