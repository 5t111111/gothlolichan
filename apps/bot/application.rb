require 'hanami/helpers'
require 'hanami/assets'

module Bot
  class Application < Hanami::Application
    configure do
    end
  end
end

begin
  Thread.new do
    Robot.run
  end

rescue => e
  puts "error! : #{e}"
  retry
end
