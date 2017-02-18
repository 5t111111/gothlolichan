module GithubWebhook
  class ProjectCardModel
    ACTION_CREATED = 'created'
    ACTION_EDITED = 'edited'
    ACTION_CONVERTED = 'converted'
    ACTION_MOVED = 'moved'
    ACTION_DELETED = 'deleted'

    private_class_method :new
    attr_reader :action, :note, :username

    def self.create(action:, project_card:, repository:, sender:)
      action.tapp
      project_card.tapp
      repository.tapp
      sender.tapp

      new(
        action: action,
        note: project_card[:note],
        username: sender[:login]
      )
    end

    def initialize(action:, note:, username:)
      @action = action
      @note = note
      @username = username
    end
  end
end
