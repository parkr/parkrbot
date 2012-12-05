# Description:
#   Just sayin' "hey".
#
# Commands:
#   hubot hi - Reply with random response
#   hubot whatup - Reply with "just the same old server livin. you?"

module.exports = (robot) ->
  robot.respond /hi$/i, (msg) ->
    msg.send "hiiiiii"

  robot.respond /whatup$/i, (msg) ->
    msg.send "just the same old server livin. you?"
