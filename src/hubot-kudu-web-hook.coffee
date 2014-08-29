# Description:
#   Hubot script to announce Kudu deployments
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_KUDU_WEB_HOOK_ROOM
#
# Commands:
#
# Author:
#   jeffgabhart

module.exports = (robot) ->
  robot.router.post "/hubot/kudu", (req, res) ->
    room = process.env.HUBOT_KUDU_WEB_HOOK_ROOM
    message = "(#{req.body.status}) #{req.body.siteName}"

    robot.logger.info "Kudu message to #{room}:\n #{message}"
    robot.messageRoom room, message

    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end 'Thanks/n'