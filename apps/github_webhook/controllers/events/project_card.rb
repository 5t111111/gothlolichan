module GithubWebhook::Controllers::Events
  class ProjectCard
    include GithubWebhook::Action
    accept :json
    before :check_webhook_secret

    def call(params)
      project_card = params.get(:project_card).to_h.tapp
      client = Slack::Web::Client.new
      client.chat_postMessage(
        channel: ENV['SLACK_DEFAULT_CHANNEL'],
        text: "プロジェクトにノートが追加されました [#{project_card[:note]}]",
        as_user: true
      )
    end
  end
end
