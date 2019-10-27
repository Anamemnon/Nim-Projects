import asyncdispatch
import jester
import times
import database, views/user, views/general

let db = newDatabase()

routes:
  get "/":
    if request.cookies.hasKey("username"):
      var user: User
      if not db.findUser(request.cookies["username"], user):
        user = User(username: request.cookies["username"], following: @[])
        db.create(user)
      let messages = db.findMessages(user.following)
      resp renderMain(renderTimeline(user.username, messages))
    else:
      resp renderMain(renderLogin())
 
  post "/login":
    setCookie("username", @"username", getTime().getGMTime() + 2.hours)
    redirect("/")

runForever()
