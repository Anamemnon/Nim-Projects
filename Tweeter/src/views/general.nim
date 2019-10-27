#? stdtmpl(subsChar = '$', metaChar = '#')
#import xmltree
#
#proc `$!`(text: string): string = escape(text)
#end proc
#
#proc renderMain*(body: string): string =
#  result = ""
<!DOCTYPE html>
<html>
  <head>
    <title>Tweeter written in Nim</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>

  <body>
    <div id="main">
      ${body}
    </div>
  </body>

</html>
#end proc
#
#proc renderLogin*(): string =
#  result = ""
<div id="login">
  <span>Login</span>
  <span class="small">Please type in your username...</span>
  <form action="login" method="post">
    <input type="text" name="username">
    <input type="submit" value="Login">
  </form>
</div>
#end proc
