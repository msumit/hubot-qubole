# hubot-qubole
Interaction with Qubole Data Services APIs via Hubot framework

## Configuration

* Register the auth token value as an environment variables when starting your bot (as usual with Hubot scripts).
 * `export HUBOT_QUBOLE_AUTH_TOKEN=your_auth_token`

If you are using Heroku to host your bot, replace `export ...` with `heroku set:config ...`.

## Adding to Your Hubot

See full instructions [here](https://github.com/github/hubot/blob/master/docs/scripting.md#npm-packages).

1. `npm install hubot-qubole --save` (updates your `package.json` file)
2. Open the `external-scripts.json` file in the root directory (you may need to create this file) and add an entry to the array (e.g. `[ 'hubot-statuspage' ]`).

## Commands

- `hubot command <id> status?` - Display an overall status of a command
