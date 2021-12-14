require 'rails_helper'

RSpec.describe 'studios index page' do
  before :each do
    @studio_1 = Studio.create!(name: "Marvel", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Universal", location: "Florida")

    @movie_1 = Movie.create!(title: "title1", creation_year: 2008, genre: "Action", studio_id: @studio_1.id)
    @movie_2 = Movie.create!(title: "title2", creation_year: 2018, genre: "Action", studio_id: @studio_1.id)
    @movie_3 = Movie.create!(title: "title3", creation_year: 2014, genre: "Romance", studio_id: @studio_2.id)
    @movie_4 = Movie.create!(title: "title4", creation_year: 2012, genre: "Action", studio_id: @studio_2.id)
  end

  it "lists name and location of each studio, and then the title of all of it's movies" do
    visit "/studios"

    within("div.studio_#{@studio_1.id}") do
      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_2.title)
    end

    within("div.studio_#{@studio_2.id}") do
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)
      expect(page).to have_content(@movie_3.title)
      expect(page).to have_content(@movie_4.title)
    end
  end
end
