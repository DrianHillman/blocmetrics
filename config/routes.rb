Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  get 'about' => 'welcome#about'

  resources :registered_applications, except: [:index]

end
