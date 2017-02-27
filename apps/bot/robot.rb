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
    expression = match.named_captures['expression']
    escaped_expression = URI.escape(expression)
    client = Slack::Web::Client.new
    client.chat_postMessage(
      channel: data.channel,
      as_user: true,
      attachments: [
        {
          fallback: expression,
          title: expression,
          image_url: "http://latex.codecogs.com/png.latex?#{escaped_expression}",
          color: '#37474F'
        }
      ].to_json
    )
  end
end
