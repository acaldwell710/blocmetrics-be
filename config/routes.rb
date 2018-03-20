Rails.application.routes.draw do

   namespace :api, defaults: { format: :json } do
     match '/events', to: 'events#preflight', via: [:options]
     resources :events, only: [:create]
   end
  resources :registered_applications do
      resources :events, except: [:create]
  end


  devise_for :users
  get "welcome/index"
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
