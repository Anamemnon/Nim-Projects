import os
import threadpool

echo("Chat application started")

if paramCount() == 0:
  quit("Please specify the server address, e.g. ./client localhost")

let sereverAddr = paramStr(1)
echo("Connecting to ", sereverAddr)

while true:
  let message = spawn readLine(stdin)
  echo("Sending \"", ^message, "\"")
