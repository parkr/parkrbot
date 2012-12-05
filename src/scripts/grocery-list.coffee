# Description:
#   Organize your grocery list
#
# Commands:
#   hubot grocery list - list items on your grocery list
#   hubot remind me to buy <item> - add item to grocery list
#   hubot i bought <item> - mark item as purchased
#   hubot remove <item> from my grocery lists

module.exports = (robot) ->
  
  robot.brain.data.groceryList = []
  groceryList =
    get: ->
      robot.brain.data.groceryList
      
    add: (item) ->
      robot.brain.data.groceryList.push item
      
    remove: (item) ->
      delete robot.brain.data.groceryList[item]
      
    bought: (item) ->
      delete robot.brain.data.groceryList[item]
      
  robot.respond /grocery list$/i, (msg) ->
    list = groceryList.get().join("\n") || "No items in your grocery list."
    msg.send list
  
  robot.respond /remind me to (buy|get) (.*)/i, (msg) ->
    item = msg.match[1].trim()
    groceryList.add item
    msg.send "ok, added #{item} to your grocery list."

  robot.respond /i bought (.*)/i, (msg) ->
    item = msg.match[1].trim()
    groceryList.bought item
    msg.send "ok, marked #{item} as purchased."
  
  robot.respond /remove (.*)/i, (msg) ->
    item = msg.match[1].trim()
    groceryList.remove item
    msg.send "ok, removed #{item} from your grocery list."
