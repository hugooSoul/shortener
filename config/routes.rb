Rails.application.routes.draw do
  root 'urls#index'

  resources :urls, only: [:index, :new, :create, :show]

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
