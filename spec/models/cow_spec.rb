require 'rails_helper'

RSpec.describe Cow do
  it {should belong_to :ranch}

  describe 'class methods' do
    before(:each) do
      @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
      @cow_2 = @ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)
      @cow_1 = @ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)

      @ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
      @cow_3 = @ranch_2.cows.create!(name: "Spotty Sue", age: 3, grass_fed: false)
    end

    describe '.all_grass_fed' do
      it 'can filter grass_fed cows' do
        expect(Cow.all_grass_fed).to eq([@cow_2, @cow_1])
      end
    end

    describe '.sort_by_name' do
      it 'can alphabetically sort by name' do
        expect(Cow.sort_by_name).to eq([@cow_1, @cow_2, @cow_3])
      end

      it 'is case insensitive' do
        cow_4 = @ranch_2.cows.create!(name: "amy anne", age: 5, grass_fed: false)
        expect(Cow.sort_by_name).to eq([cow_4, @cow_1, @cow_2, @cow_3])
      end
    end

    describe '.older_than(age_threshold)' do
      it 'returns cows older than age_threshold' do
        expect(Cow.older_than(2)).to eq([@cow_2, @cow_3])
      end
    end

    describe '.exact_name(name)' do
      it 'returns cow when name is an exact match' do
        expect(Cow.exact_name("Bessie Lou")).to eq([@cow_1])
        expect(Cow.exact_name("Bessie")).to eq([])
      end
    end

    describe '.partial_name_search(name)' do
      it 'returns cow when name is an exact match' do
        expect(Cow.partial_name_search("Lou")).to eq([@cow_1])
        expect(Cow.partial_name_search("bessie")).to eq([@cow_1])
      end
    end
  end
end
