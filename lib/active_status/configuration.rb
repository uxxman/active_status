module ActiveStatus
  class Configuration
    attr_accessor :error_code, :success_code, :verbose, :checks

    def initialize
      reset!
    end

    def reset!
      @checks       = {}
      @verbose      = false
      @error_code   = 503
      @success_code = 200
    end

    def check(name, &block)
      @checks[name] = block
    end
  end
end
