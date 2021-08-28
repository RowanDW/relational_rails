require 'rails_helper'

RSpec.describe Cow do
  it {should belong_to :ranch}

  describe 'class methods' do
    before(:each) do
      @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
      @cow_1 = @ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)
      @cow_2 = @ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)

      @ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
      @cow_3 = @ranch_2.cows.create!(name: "Spotty Sue", age: 3, grass_fed: false)
    end

    it 'can filter grass_fed cows' do
      expect(Cow.all_grass_fed).to eq([@cow_1, @cow_2])
    end
  end
end
