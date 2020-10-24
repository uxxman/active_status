Rails.application.routes.draw do
  mount RailsHealthStatus::Engine => "/rails_health_status"
end
