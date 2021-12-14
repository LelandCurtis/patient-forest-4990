class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.average_age
    ages = pluck(:age)
    avg = ages.sum / ages.count.to_f
  end
end
