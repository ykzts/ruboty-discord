require 'spec_helper'
require 'ostruct'
require 'discordrb'
require 'ruboty'
require 'ruboty/adapters/discord'

RSpec.describe Ruboty::Adapters::Discord do
  around do |example|
    original_discord_token = ENV['DISCORD_TOKEN']
    ENV['DISCORD_TOKEN'] = 'xxxxxxxxxxxxxxxxxxxx'
    example.run
    ENV['DISCORD_TOKEN'] = original_discord_token
  end

  let(:robot) do
    Ruboty::Robot.new
  end

  let(:adapter) do
    described_class.new(robot)
  end

  describe '#run' do
    # todo
  end

  describe '#say' do
    before do
      allow_any_instance_of(Discordrb::Bot).to receive(:send_message) do |_, channel_id, content|
        channel = OpenStruct.new(id: channel_id)
        OpenStruct.new(content: content, channel: channel)
      end
    end

    let(:body) { 'content body' }

    let(:code) { false }

    let(:message) do
      { body: body, to: 0, code: code }
    end

    subject do
      adapter.say(message)
    end

    context 'when code false' do
      it do
        expect(subject.content).to eq('content body')
      end
    end

    context 'when code true' do
      let(:code) { true }

      it do
        expect(subject.content).to eq("```\ncontent body\n```")
      end
    end
  end
end
