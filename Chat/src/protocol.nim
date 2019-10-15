import json

type
  Message* = object
    username*: string
    message*: string

proc parseMessage* (data: string): Message =
  let dataJSON = parseJson(data)
  result.username = dataJSON["username"].getStr()
  result.message = dataJSON["message"].getStr()

when isMainModule:
  block:
    let data = """{"username": "John", "message": "Hi!"}"""
    let parsed = parseMessage(data)
    doAssert parsed.username == "John"
    doAssert parsed.message == "Hi!"
  
  block:
    let data = """foobar"""
    try:
      let parsed = parseMessage(data)
      doAssert false
    except JsonParsingError:
      doAssert true
    except:
      doAssert false
  
  echo("All tests passed!")
    