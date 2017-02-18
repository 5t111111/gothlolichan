class Robot < SlackRubyBot::Bot
  command 'say' do |client, data, _match|
    # p client
    # data.tapp
    # _match.tapp
    client.say(channel: data.channel, text: 'hey')
  end

  command 'raise' do |_client, _data, _match|
    raise
  end
end
