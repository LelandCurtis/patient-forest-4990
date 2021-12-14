require 'rails_helper'

RSpec.describe Actor, type: :model do
  it {should have_many(:actor_movies)}
  it {should have_many(:movies).through(:actor_movies)}

  describe 'average_age' do
    it "returns the average age of all actors" do
      actor_1 = Actor.create!(name: 'bob', age: 10)
      actor_2 = Actor.create!(name: 'steve', age: 20)
      expect(Actor.average_age).to eq(15)
    end
  end
end
