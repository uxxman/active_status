Rails.application.routes.draw do
  mount ActiveStatus::Engine => '/status'
end
