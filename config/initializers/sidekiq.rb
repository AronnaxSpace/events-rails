# frozen_string_literal: true

# Build Redis URL with password from credentials in production
redis_url = if Rails.env.production? && Rails.application.credentials.dig(:redis, :password)
              "redis://:#{Rails.application.credentials.dig(:redis, :password)}@127.0.0.1:6379"
            else
              'redis://127.0.0.1:6379'
            end

Sidekiq.configure_server do |config|
  config.redis = {
    url: redis_url,
    namespace: ENV.fetch('SIDEKIQ_NAMESPACE', 'events')
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: redis_url,
    namespace: ENV.fetch('SIDEKIQ_NAMESPACE', 'events')
  }
end
