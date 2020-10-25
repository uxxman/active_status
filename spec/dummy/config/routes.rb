Rails.application.routes.draw do
  mount RailsHealthStatus::Engine => '/status'
end
