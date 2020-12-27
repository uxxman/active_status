module ActiveStatus
  class Error
    attr_accessor :name, :error, :message

    def initialize(name, error, message = nil)
      @name    = name
      @error   = error
      @message = message
    end

    def as_json(_ = nil)
      hash = { name: name, error: error }
      return hash unless ActiveStatus.config.verbose

      hash.merge({ message: message })
    end
  end
end
