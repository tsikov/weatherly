Rails.application.routes.draw do
  get 'location', to: "locations#show"
  get 'location/random', to: "locations#random"
  get 'location/not-found', to: "locations#not_found"

  root to: "locations#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
