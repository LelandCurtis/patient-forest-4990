Rails.application.routes.draw do

  get '/studios', to: 'studios#index'

  get '/movies/:id', to: 'movies#show'

  post '/actor_movies', to: 'actor_movies#create'

end
