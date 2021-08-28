Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/farms', to: 'farms#index'
  get '/farms/:id', to: 'farms#show'
  get '/farms/:id/crops', to: 'farm_crops#index'

  get '/crops', to: 'crops#index'
  get '/crops/:id', to: 'crops#show'

  get '/ranches', to: 'ranches#index'
  get '/ranches/new', to: 'ranches#new'
  get '/ranches/:id', to: 'ranches#show'
  get '/ranches/:ranch_id/cows', to: 'ranch_cows#index'
  post '/ranches', to: 'ranches#create'

  get '/cows', to: 'cows#index'
  get '/cows/:id', to: 'cows#show'
end
