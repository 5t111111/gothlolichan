require_relative 'worker'

module Bot
  class Application < Hanami::Application
    Worker.new.run
  end
end
