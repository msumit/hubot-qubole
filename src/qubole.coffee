# Description:
#   Interaction with Qubole Data Services APIs via Hubot framework
#
# Configuration:
#   HUBOT_QUBOLE_AUTH_TOKEN - Required
#
# Commands:
#   hubot command <id> status
#
# Author:
#   Sumit Maheshwari <sumeet.manit@gmail.com>

module.exports = (robot) ->
  baseUrl = "https://api.qubole.com/api/latest/"
  authHeader = Authorization: "X-AUTH-TOKEN #{process.env.HUBOT_QUBOLE_AUTH_TOKEN}"


  robot.respond /command (\d+) status\??/i, (msg) ->
    cmd_id = msg.match[1]
    msg.http("#{baseUrl}/commands/#{cmd_id}.json").headers(authHeader).get() (err, res, body) ->
      response = JSON.parse body
      if response.error
        msg.send "Error talking to Qubole: #{response.error}"
      else
        msg.send "Command status: #{response}"
