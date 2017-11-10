Rails.application.routes.draw do
  get 'location', to: "locations#show"
  get 'location/random', to: "locations#random"

  root to: "locations#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
