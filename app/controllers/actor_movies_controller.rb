class ActorMoviesController < ApplicationController
  def create
    actor = Actor.where(name: params[:name])
    application = Application.find(params[:movie_id])
  end
end
