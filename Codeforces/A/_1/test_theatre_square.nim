import unittest
from theatre_square import getSlabs


suite "theatre_square":
  test "big integer":
    check getSlabs(1_000_000_000, 1_000_000_000, 1) == 1_000_000_000_000_000_000