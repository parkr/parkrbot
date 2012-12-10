# Description:
#   A way to interact with the Google Images API.
#
# Commands:
#   hubot image me <query> - The Original. Queries Google Images for <query> and returns a random top result.
#   hubot animate me <query> - The same thing as `image me`, except adds a few parameters to try to return an animated GIF instead.
#   hubot mustache me <url> - Adds a mustache to the specified URL.
#   hubot mustache me <query> - Searches Google Images for the specified query and mustaches it.

module.exports = (robot) ->
  robot.respond /(github|gh)( (status|st))?/i, (msg) ->
    getStatus msg, (status) ->
      msg.send status

getStatus = (msg) ->
  msg.http('https://status.github.com/api/last-message.json')
    .get() (err, res, body) ->
      result = JSON.parse(body)
      cb "#{result.body} as of #{formatDate(new Date(result.created_on))}"

formatDate = (date) ->
  year = date.getFullYear()
  month = date.getMonth()+1
  day = date.getDate()
  hour = date.getHours()
  minute = date.getMinutes()
  second = date.getSeconds()
  return "#{hour}#{minute} on #{month} #{day}, #{year}"
