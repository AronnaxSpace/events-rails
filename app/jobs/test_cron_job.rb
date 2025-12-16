class TestCronJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.info 'TestCronJob: Hello, world!'
  end
end
