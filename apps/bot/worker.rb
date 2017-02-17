module Bot
  class Worker
    def run
      Thread.new do
        Robot.run
      end
    rescue => e
      puts "error! : #{e}"
      retry
    end
  end
end
