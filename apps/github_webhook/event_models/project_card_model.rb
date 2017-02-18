module GithubWebhook
  class ProjectCardModel
    private_class_method :new

    attr_reader :note

    def self.create(payload)
      payload = payload.to_h

      new(
        note: payload[:note]
      )
    end

    def initialize(note:)
      @note = note
    end
  end
end
