class RemoveMovieIdFromActors < ActiveRecord::Migration[5.2]
  def change
    remove_column :actors, :movie_id, :references
  end
end
