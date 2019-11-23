Rails.application.routes.draw do
  get '/', to: 'home#index'
  get '/logs', to: 'home#logs'
  get '/backups', to: 'home#backups'
  get '/statistics', to: 'home#statistics'

  resources :people

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
