# frozen_string_literal: true

require 'discordrb'
require 'ruboty/adapters/base'

module Ruboty
  module Adapters
    class Discord < Base
      env :DISCORD_TOKEN, 'Account\'s token. get one on https://discordapp.com/developers/applications/me'

      def run
        init
        bind
        connect
      end

      def say(message)
        channel_id = message[:to]
        content    = message[:code] ? "```\n#{message[:body]}\n```" : message[:body]

        bot.send_message(channel_id, content)
      end

      private

      def bot
        @bot ||= Discordrb::Bot.new(token: ENV['DISCORD_TOKEN'])
      end

      def init
        bot.ready do
          ENV['RUBOTY_NAME'] = bot.profile.username
        end
      end

      def bind
        bot.message do |event|
          on_message(event.message)
        end
      end

      def connect
        bot.run
      end

      def on_message(message)
        body = message.content.gsub(/<@([^>]+?)>/) do |matched|
          user_id = $1.to_i
          user = message.mentions.find { |user| user.id == user_id }
          user.nil? ? matched : "@#{user.username}"
        end

        robot.receive(
          body: body,
          from: message.channel.id,
          from_name: message.author.name,
          to: message.channel.id,
          time: message.timestamp
        )
      end
    end
  end
end
