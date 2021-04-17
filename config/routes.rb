Rails.application.routes.draw do
  #devise_for :users
  resources :items
  resources :user

  resources :pay
  
  resources :history

  resources :shops, only:[:index, :show]

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
