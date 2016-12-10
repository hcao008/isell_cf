Rails.application.routes.draw do
  resources :profiles

#Add devise registrations controller to allow after sign up path
  devise_for :users, controllers: { registrations: "registrations" }
  root 'home#index'
  get 'home/index'

# Add about page routes
get 'about', to: 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
