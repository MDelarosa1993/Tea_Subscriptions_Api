Rails.application.routes.draw do  
  get "/api/v1/customers/:customer_id/subscriptions", to: "api/v1/subscriptions#index"
  get "/api/v1/customers/:customer_id/subscriptions/:id", to: "api/v1/subscriptions#show"
  patch "/api/v1/customers/:customer_id/subscriptions/:id", to: "api/v1/subscriptions#update"

  get '/api/v1/customers', to: "api/v1/customers#index"

  get '/api/v1/teas', to: "api/v1/teas#index"
  get "up" => "rails/health#show", as: :rails_health_check

end
