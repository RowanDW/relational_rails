Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/farms', to: 'farms#index'
  get '/ranches', to: 'ranches#index'
  get '/farms/:id', to: 'farms#show'
  get '/crops', to: 'crops#index'
  get '/crops/:id', to: 'crops#show'
  get '/farms/:id/crops', to: 'farm_crops#index'

end
