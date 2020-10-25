require 'rails_health_status/error'
require 'rails_health_status/engine'
require 'rails_health_status/report'
require 'rails_health_status/configuration'

module RailsHealthStatus
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new

    yield configuration
  end

  def self.reconfigure
    self.configuration = Configuration.new
  end
end
