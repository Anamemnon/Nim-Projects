import os, threadpool, asyncdispatch, asyncnet
import protocol

proc connect(socket: AsyncSocket, sereverAddr: string) {.async.} =
  echo("Connecting to ", sereverAddr)
  await socket.connect(sereverAddr, 7687.Port)
  echo("Connected!")

  while true:
    let line = await socket.recvLine()
    let parsed = parseMessage(line)
    echo(parsed.username, " said ", parsed.message)

echo("Chat application started")
if paramCount() == 0:
  quit("Please specify the server address, e.g. ./client localhost")
let sereverAddr = paramStr(1)
var socket = newAsyncSocket()

asyncCheck connect(socket, sereverAddr)

var messageFlowVar = spawn stdin.readLine()

while true:
  if messageFlowVar.isReady():
    let message = createMessage("Anonymous", ^messageFlowVar)
    asyncCheck socket.send(message)
    messageFlowVar = spawn stdin.readLine()
  
  asyncdispatch.poll()
