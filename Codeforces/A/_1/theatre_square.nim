import strutils
from sequtils import map

proc getSlabs*(n, m, a: int): int = toInt(((n - 1)/a + 1)) * toInt(((m - 1)/a + 1))

when isMainModule:
  let input = readLine(stdin)
  let numbers = input.split(' ').map(parseInt)

  echo getSlabs(numbers[0], numbers[1], numbers[2])