Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'welcome/about'

  resources :applications

  root to: 'welcome#index'
end
