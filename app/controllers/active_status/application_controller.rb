module ActiveStatus
  class ApplicationController < ActionController::API
    def status
      report = ActiveStatus::Report.new
      report.build

      if report.success?
        head ActiveStatus.config.success_code
      else
        render json: report.errors, status: ActiveStatus.config.error_code
      end
    end
  end
end
