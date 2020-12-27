require 'active_status/error'
require 'active_status/report'
require 'active_status/version'
require 'active_status/configuration'
require 'active_status/engine' if defined?(Rails::Engine)

module ActiveStatus
  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield config
  end
end
