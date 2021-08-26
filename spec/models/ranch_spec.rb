require 'rails_helper'

RSpec.describe Ranch do
  it {should have_many :cows}

  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @cow_1 = @ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)
    @cow_2 = @ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)
  end

  it 'can count cows' do
    expect(@ranch_1.cows_count).to eq(2)
  end
end
