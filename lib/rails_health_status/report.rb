module RailsHealthStatus
  class Report
    attr_reader :errors

    def initialize
      @errors = []
    end

    def self.define_check(name, body)
      define_method(name, body)
    end

    def build
      RailsHealthStatus.configuration.checks.each do |check|
        begin
          send(check)
        rescue StandardError => e
          @errors << Error.new(check, e.class, e.message)
        end
      end
    end

    def success?
      @errors.empty?
    end
  end
end
