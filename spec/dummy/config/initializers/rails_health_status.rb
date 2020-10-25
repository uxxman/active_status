RailsHealthStatus.configure do |config|
  config.success = 200
  config.error   = 503
  config.verbose = true

  config.check :database do
    ActiveRecord::Base.connection.execute('select 1')
  end

  config.check :migrations do
    ActiveRecord::Migration.check_pending!
  end

  config.check :cache do
    Rails.cache.read('some_key')
  end

  config.check :sidekiq do
    Sidekiq.redis(&:ping)
  end
end
