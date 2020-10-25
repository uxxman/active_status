module RailsHealthStatus
  class Configuration
    attr_accessor :checks, :error, :success, :verbose

    def initialize
      self.checks  = []
      self.error   = 503
      self.success = 200
      self.verbose = false
    end

    def check(name, &block)
      checks << name

      Report.define_check(name, block)
    end
  end
end
