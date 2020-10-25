require 'active_status/error'
require 'active_status/engine'
require 'active_status/report'
require 'active_status/configuration'

module ActiveStatus
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
