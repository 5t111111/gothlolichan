module GithubWebhook
  class ProjectCardModel
    ACTION_CREATED = 'created'
    ACTION_EDITED = 'edited'
    ACTION_CONVERTED = 'converted'
    ACTION_MOVED = 'moved'
    ACTION_DELETED = 'deleted'

    private_class_method :new
    attr_reader :action, :note, :username, :repository_name

    def self.create(action:, project_card:, repository:, sender:)
      new(
        action: action,
        note: project_card[:note],
        username: sender[:login],
        repository_name: repository[:full_name]
      )
    end

    def initialize(action:, note:, username:, repository_name:)
      @action = action
      @note = note
      @username = username
      @repository_name = repository_name
    end

    def text
      case action
      when ACTION_CREATED
        "#{repository_name} のプロジェクトにノートが追加されました"
      when ACTION_EDITED
        "#{repository_name} のプロジェクトのノートが編集されました"
      when ACTION_CONVERTED
        "#{repository_name} のプロジェクトのノートが issue に変換されました"
      when ACTION_MOVED
        "#{repository_name} のプロジェクトのノートが移動されました"
      when ACTION_DELETED
        "#{repository_name} のプロジェクトのノートが削除されました"
      end
    end

    def attachments
      case action
      when ACTION_CREATED
        [
          {
            fallback: text,
            pretext: text,
            title: "#{username} has created a note",
            text: note,
            color: '#EC407A'
          }
        ]
      when ACTION_EDITED
        [
          {
            fallback: text,
            pretext: text,
            title: "#{username} has edited the note",
            text: note,
            color: '#AB47BC'
          }
        ]
      when ACTION_CONVERTED
        [
          {
            fallback: text,
            pretext: text,
            title: "#{username} has converted the note",
            text: note,
            color: '#5C6BC0'
          }
        ]
      when ACTION_MOVED
        [
          {
            fallback: text,
            pretext: text,
            title: "#{username} has moved the note",
            text: note,
            color: '#26C6DA'
          }
        ]
      when ACTION_DELETED
        [
          {
            fallback: text,
            pretext: text,
            title: "#{username} has deleted the note",
            text: note,
            color: '#FF7043'
          }
        ]
      end.to_json
    end
  end
end
