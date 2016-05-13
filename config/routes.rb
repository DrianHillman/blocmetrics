Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  
  get 'about' => 'welcome#about'

  resources :registered_applications, except: [:index]
  
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      match '/events', to: 'events#preflight', via: [:options]
      resources :events, only: [:create]
    end
  end
end
