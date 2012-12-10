# Description:
#   A way to interact with the Google Images API.
#
# Commands:
#   hubot github status - returns github status (also "gh st", or just "github" or "gh")

module.exports = (robot) ->
  robot.respond /(github|gh)( (status|st))?/i, (msg) ->
    getStatus msg, (status) ->
      msg.send status

getStatus = (msg, cb) ->
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
  return "#{hour}:#{minute} on #{monthInWords[month]} #{day}#{endingForDay(day)}, #{year}"

monthInWords =
  1: "January",
  2: "February",
  3: "March",
  4: "April",
  5: "May",
  6: "June",
  7: "July",
  8: "August",
  9: "September",
  10: "October",
  11: "November",
  12: "December"

endingForDay = (dayOfMonth) ->
  if dayOfMonth >= 11 and dayOfMonth <= 13
    return "th"
  switch n % 10
    when 1 then return "st"
    when 2 then return "nd"
    when 3 then return "rd"
    else return "th"