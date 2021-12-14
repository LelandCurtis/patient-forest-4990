require 'rails_helper'

RSpec.describe ActorMovie, type: :model do
  it {should belong_to(:actor)}
  it {should belong_to(:movie)}
end
