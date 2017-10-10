Rails.application.routes.draw do
  resources :solar_systems
  resources :stars
  resources :planets
  resources :foos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
