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

  command 'latex' do |client, data, match|
    client = Slack::Web::Client.new
    client.chat_postMessage(
      channel: data.channel,
      as_user: true,
      attachments: [
        {
          fallback: match,
          title: match,
          image_url: "http://latex.codecogs.com/gif.latex?#{match.named_captures['expression']}",
          color: '#37474F'
        }
      ].to_json
    )
  end
end
