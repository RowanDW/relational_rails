require 'rails_helper'

RSpec.describe Ranch do
  it {should have_many :cows}

  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @cow_2 = @ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)
    @cow_1 = @ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)

    @ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
    @cow_3 = @ranch_2.cows.create!(name: "Spotty Sue", age: 3, grass_fed: false)

    @ranch_3 = Ranch.create!(name: "Big Bobby's Bovine Bonanza", max_capacity: 70, certified_humane: false)
    @cow_4 = @ranch_3.cows.create!(name: "John", age: 1, grass_fed: false)
    @cow_5 = @ranch_3.cows.create!(name: "Paul", age: 2, grass_fed: false)
    @cow_6 = @ranch_3.cows.create!(name: "George", age: 3, grass_fed: false)
    @cow_7 = @ranch_3.cows.create!(name: "Ringo", age: 4, grass_fed: false)

    @ranch_4 = Ranch.create!(name: "No cows", max_capacity: 70, certified_humane: false)
  end

  it 'can count cows' do
    expect(@ranch_1.cows_count).to eq(2)
    expect(@ranch_4.cows_count).to eq(0)
  end

  describe 'class methods' do
    describe '#order_created_at_desc' do
      it 'can order ranches in descending order' do
        expect(Ranch.order_created_at_desc).to eq([@ranch_4, @ranch_3, @ranch_2, @ranch_1])
      end
    end

    describe '.sort_by_num' do
      it 'can sort ranches by number of cows per ranch' do
        expect(Ranch.sort_by_num).to eq([@ranch_3, @ranch_1, @ranch_2, @ranch_4])
      end
    end
  end
end
