# Description:
#   Interaction with Qubole Data Services APIs via Hubot framework
#
# Configuration:
#   HUBOT_QUBOLE_AUTH_TOKEN - Required
#
# Commands:
#   hubot command <id> status - Display the status of given command id
#   hubot cluster <id> status - Display the status of given cluster id
#   hubot cluster <id> nodes - Display the nodes information of given cluster id
#   hubot cluster <id> usage - Show the usage statistics for the given cluster id
#   hubot qcuh - Show the QCUH consumed in ongoing month
#   hubot schedule <id> runs - Shows the last 10 run of a given schedule
#   hubot template <id> runs - Shows the last 10 run of a given template
#   hubot note <id> status - Display the status of a given notebook id
#
# Author:
#   Sumit Maheshwari <sumeet.manit@gmail.com>

module.exports = (robot) ->
  baseUrl = "https://api.qubole.com/api/latest/"
  authHeader = {'X-AUTH-TOKEN': process.env.HUBOT_QUBOLE_AUTH_TOKEN, 'Content-Type': 'application/json'}

  robot.respond /command (\d+) status$/i, (msg) ->
    cmd_id = msg.match[1]

    msg.http("#{baseUrl}/commands/#{cmd_id}.json").headers(authHeader).get() (err, res, body) ->

      if res.statusCode >= 500
        msg.send "Sorry, something went wrong :("
        return

      response = JSON.parse body

      if response.error
        msg.send "Error talking to Qubole: #{response.error.error_message}"
      else
        msg.send "Current status of #{cmd_id}(#{response.command_type}) is: #{response.status}"


  robot.respond /cluster (\d+) status$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /cluster (\d+) nodes$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /cluster (\d+) usage$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /qcuh$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /schedule (\d+) runs$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /note (\d+) status/i, (msg) ->
    msg.send "Not implemented yet"