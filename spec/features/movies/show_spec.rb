require 'rails_helper'

RSpec.describe 'movies show page' do
  before :each do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    @movie_1 = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @movie_2 = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

    @marvel = Studio.create!(name: 'Mervel Studios', location: 'Florida')

    @movie_3 = @marvel.movies.create!(title: 'Iron Man', creation_year:2005, genre: 'Action/Adventure')
    @movie_4 = @marvel.movies.create!(title: 'Thor', creation_year: 2015, genre: 'Comedy')

    @actor_1 = Actor.create!(name: "Harrison Ford", age: 56)
    @actor_2 = Actor.create!(name: "Robert Downy Junior", age: 46)
    @actor_3 = Actor.create!(name: "Pete Davidson", age: 16)

    @actor_movie_1 = ActorMovie.create!(actor_id: @actor_1.id, movie_id: @movie_1.id)
    @actor_movie_2 = ActorMovie.create!(actor_id: @actor_2.id, movie_id: @movie_1.id)
    @actor_movie_3 = ActorMovie.create!(actor_id: @actor_1.id, movie_id: @movie_2.id)
    @actor_movie_4 = ActorMovie.create!(actor_id: @actor_1.id, movie_id: @movie_3.id)
    @actor_movie_5 = ActorMovie.create!(actor_id: @actor_3.id, movie_id: @movie_3.id)
    @actor_movie_6 = ActorMovie.create!(actor_id: @actor_3.id, movie_id: @movie_4.id)
  end

  it "shows each movie title, creation year and genre" do
    visit "/movies/#{@movie_1.id}"
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
  end

  it 'each movie shows a list of its actors from youngest to oldest' do
    visit "/movies/#{@movie_1.id}"
    expect(@actor_2.name).to appear_before(@actor_1.name)
  end

  it 'shows the average age of the movies actors' do
    visit "/movies/#{@movie_1.id}"
    expect(page).to have_content("51")
  end
end
