module ActiveStatus
  class Error
    attr_accessor :name, :error, :message

    def initialize(name, error, message)
      self.name    = name
      self.error   = error.name
      self.message = message&.squish
    end

    def as_json(_ = nil)
      hash = { name: name, error: error }
      return hash unless ActiveStatus.configuration.verbose

      hash.merge({ message: message })
    end
  end
end
