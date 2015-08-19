Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'
  get 'welcome/about'

  resources :registered_applications do
    resources :events, except: [:index, :show]
  end

  root to: 'welcome#index'
end
