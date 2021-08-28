require 'rails_helper'

RSpec.describe Ranch do
  it {should have_many :cows}

  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
    @ranch_3 = Ranch.create!(name: "Ranchy Ranch", max_capacity: 200, certified_humane: false)
    @cow_1 = @ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)
    @cow_2 = @ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)
  end

  it 'can count cows' do
    expect(@ranch_1.cows_count).to eq(2)
  end

  describe 'class methods' do
    describe '#order_created_at_desc' do
      it 'can order ranches in descending order' do
        expect(Ranch.order_created_at_desc).to eq([@ranch_3, @ranch_2, @ranch_1])
      end
    end
  end
end
