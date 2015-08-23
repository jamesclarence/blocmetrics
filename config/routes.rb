Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'
  get 'welcome/about'

  resources :registered_applications do
    resources :events, except: [:index, :show]
  end

  namespace :api, defaults: { format: :json } do
    resources :events, only: [:create]
  end

  root to: 'welcome#index'

  match '/event', to: 'events#index', via: [:options]
  resources :events, only: [:create]
end
