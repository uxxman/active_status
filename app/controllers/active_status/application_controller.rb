module ActiveStatus
  class ApplicationController < ActionController::API
    def status
      report = ActiveStatus::Report.new
      report.build

      if report.success?
        head ActiveStatus.configuration.success
      else
        render json: report.errors, status: ActiveStatus.configuration.error
      end
    end
  end
end
