# Ruboty::Discord [![build status](https://travis-ci.org/ykzts/ruboty-discord.svg?branch=master)](https://travis-ci.org/ykzts/ruboty-discord)

Discord adapter for [Ruboty](https://github.com/r7kamura/ruboty).

## Install

```ruby
# Gemfile
gem 'ruboty-discord'
```

## Usage

1. Create new App ([https://discordapp.com/developers/applications/me/create](https://discordapp.com/developers/applications/me/create))
2. Get Client ID & bot user token
3. Open `https://discordapp.com/oauth2/authorize?scope=bot&client_id=xxxxxxxxx` (Replace `xxxxxxxxx` with client ID)

## Environment variables

| Name            | Description       |
|-----------------|-------------------|
| `DISCORD_TOKEN` | Bot user's token. |

## License

[MIT](LICENSE)
