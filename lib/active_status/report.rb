module ActiveStatus
  class Report
    attr_reader :errors

    def initialize
      @errors = []
    end

    def build
      ActiveStatus.config.checks.each do |check, method|
        begin
          success = method.call

          add_error(Error.new(check, 'failure')) unless success
        rescue StandardError => e
          add_error(Error.new(check, e.class.name, e.message))
        end
      end
    end

    def success?
      @errors.empty?
    end

    def add_error(error)
      @errors << error
    end
  end
end
