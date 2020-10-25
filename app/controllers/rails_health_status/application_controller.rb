module RailsHealthStatus
  class ApplicationController < ActionController::API
    def status
      report = RailsHealthStatus::Report.new
      report.build

      if report.success?
        head RailsHealthStatus.configuration.success
      else
        render json: report.errors, status: RailsHealthStatus.configuration.error
      end
    end
  end
end
