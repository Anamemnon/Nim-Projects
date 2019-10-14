from watermelon_№4 import watermelon
import unittest

suite "watermelon":
  test "YES":
    for i in countUp(4, 100, 2):
      check watermelon(i) == "YES"
  
  test "NO":
    for i in countUp(1, 99, 2):
      check watermelon(i) == "NO"
    check watermelon(2) == "NO"
    