type
  Message* = object
    username*: string
    message*: string

proc parseMessage* (dara: string): Message =
  discard
