require 'rails_health_status/error'
require 'rails_health_status/engine'
require 'rails_health_status/report'
require 'rails_health_status/configuration'

module RailsHealthStatus
  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    yield configuration
  end

  def reset_configuration
    @configuration = Configuration.new
  end

  module_function :configure, :configuration, :reset_configuration
end
