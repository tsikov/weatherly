Rails.application.routes.draw do
  get 'locations/show', to: "locations#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
