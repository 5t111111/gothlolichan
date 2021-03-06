require_relative '../../event_models/project_card_model'

module GithubWebhook::Controllers::Events
  class ProjectCard
    include GithubWebhook::Action
    accept :json
    before :check_webhook_secret

    def call(params)
      project_card = GithubWebhook::ProjectCardModel.create(
        action: params.get(:action),
        project_card: params.get(:project_card),
        repository: params.get(:repository),
        sender: params.get(:sender)
      )

      client = Slack::Web::Client.new
      client.chat_postMessage(
        channel: ENV['SLACK_DEFAULT_CHANNEL'],
        as_user: true,
        attachments: project_card.attachments
      )
    end
  end
end
