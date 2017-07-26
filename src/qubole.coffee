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
  authHeader = {'X-AUTH-TOKEN': process.env.HUBOT_QUBOLE_AUTH_TOKEN, 'Content-Type': 'application/json'}

  robot.respond /command (\d+) status\??/i, (msg) ->
    cmd_id = msg.match[1]

    msg.http("#{baseUrl}/commands/#{cmd_id}.json").headers(authHeader).get() (err, res, body) ->

      if res.statusCode isnt 200
        res.send "Request didn't come back HTTP 200 :("
        return

      response = JSON.parse body

      if response.error
        msg.send "Error talking to Qubole: #{response.error}"
      else
        msg.send "Current status of #{response.command_type}(#{cmd_id}) is: #{response.status}"
