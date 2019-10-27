import asyncdispatch
import jester
import times
import database, views/user, views/general

routes:
  get "/":
    resp renderMain(renderLogin())
 
  post "/login":
    setCookie("username", @"username", getTime().getGMTime() + 2.hours)
    redirect("/")

runForever()
