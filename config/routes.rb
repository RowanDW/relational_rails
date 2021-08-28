Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/farms', to: 'farms#index'
  get '/farms/new', to: 'farms#new'
  get '/farms/:id/crops/new', to: 'farm_crops#new'
  get '/farms/:id/crops', to: 'farm_crops#index'
  get '/farms/:id/edit', to: 'farms#edit'
  get '/farms/:id', to: 'farms#show'
  post '/farms/:id/crops', to: 'farm_crops#create'
  post '/farms', to: 'farms#create'
  patch '/farms/:id', to: 'farms#update'

  get '/crops', to: 'crops#index'
  get '/crops/:id', to: 'crops#show'

  get '/ranches', to: 'ranches#index'
  get '/ranches/new', to: 'ranches#new'
  get '/ranches/:id', to: 'ranches#show'
  get '/ranches/:ranch_id/cows', to: 'ranch_cows#index'
  get '/ranches/:ranch_id/cows/new', to: 'ranch_cows#new'
  post 'ranches/:ranch_id/cows', to: 'ranch_cows#create'
  post '/ranches', to: 'ranches#create'
  get '/ranches/:id/edit', to: 'ranches#edit'
  patch '/ranches/:id', to: 'ranches#update'

  get '/cows', to: 'cows#index'
  get '/cows/:id', to: 'cows#show'
end
