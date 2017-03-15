Rails.application.routes.draw do

  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  devise_scope :user do
   get "sign_up", to: "devise/registrations#new"
   get "log_in", to: "devise/sessions#new"
   get "log_out", to: "devise/sessions#destroy"
end
end
