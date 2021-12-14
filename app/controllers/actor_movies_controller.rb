class ActorMoviesController < ApplicationController
  def create
    actor = Actor.where(name: params[:name])
    movie = Movie.find(params[:movie_id])
    ActorMovie.create(actor_id: actor.id, movie_id: movie.id)
    redirect_to "/movies/#{movie.id}"
  end
end
