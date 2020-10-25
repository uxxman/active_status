require_relative 'boot'

require "rails/all"

Bundler.require(*Rails.groups)

require "active_status"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults Rails::VERSION::MAJOR + (Rails::VERSION::MINOR / 10.0)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
