Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/backgrounds', to: 'backgrounds#show'
      get '/munchies', to: 'munchies#show'
    end
  end
end
