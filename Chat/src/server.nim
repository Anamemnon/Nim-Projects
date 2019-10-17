import asyncdispatch, asyncnet

type
  Client = ref object
    socket: AsyncSocket
    netAddr: string
    id: int
    connected: bool
  
  Server = ref object
    socket: AsyncSocket
    clients: seq[Client]

proc newServer(): Server =
  Server(socket: newAsyncSocket(), clients: @[])

var server = newServer()

proc loop(server: Server, port = 7687) {.async.} =
  server.socket.bindAddr(port.Port)
  server.socket.listen()

  while true:
    let clientSocket = await server.socket.accept()
    echo("Accepted connection!")

waitFor loop(server)
