class HelloWorldJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "🚀 Hello from Sidekiq Job!"
  end
end
