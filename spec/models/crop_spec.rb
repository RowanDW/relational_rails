require 'rails_helper'

RSpec.describe Crop do
  it {should belong_to :farm}

  describe 'class methods' do
    before(:each) do
      @farm = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
      @crop1 = @farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
      @crop2 = @farm.crops.create!(name: 'Beans', yield: 65, annual: true)
      @crop3 = @farm.crops.create!(name: 'Apples', yield: 22, annual: false)
    end

    describe '#only_annuals' do
      it 'only returns crops where annual is true' do
        expect(Crop.only_annuals).to eq([@crop1, @crop2])

        @crop4 = @farm.crops.create!(name: 'Plums', yield: 5, annual: false)
        @crop5 = @farm.crops.create!(name: 'Potatoes', yield: 60, annual: true)

        expect(Crop.only_annuals).to eq([@crop1, @crop2, @crop5])
      end
    end

    describe '#alphabatize_crops' do
      it "can put order crops alphabetically" do
        expect(Crop.alphabatize_crops).to eq([@crop3, @crop2, @crop1])
      end

      it 'is case insensitive' do
        crop4 = @farm.crops.create!(name: 'cabbage', yield: 12, annual: true)
        expect(Crop.alphabatize_crops).to eq([@crop3, @crop2, crop4, @crop1])
      end
    end

    describe '#yield_threshold' do
      it "can filter out crops under inputted num" do
        crop4 = @farm.crops.create!(name: 'Cabbage', yield: 12, annual: true)

        expect(Crop.yield_threshold(20)).to eq([@crop1, @crop2, @crop3])
      end
    end

    describe 'name_search' do

      it 'returns all crops with exact name matching' do
        crop4 = @farm.crops.create!(name: 'Apples', yield: 22, annual: false)
        expect(Crop.exact_name_search("Apples")).to eq([@crop3, crop4])
        expect(Crop.exact_name_search("Beans")).to eq([@crop2])
        expect(Crop.exact_name_search("Potatoes")).to eq([])
      end

      it 'returns all crops with partial name matching' do
        crop4 = @farm.crops.create!(name: 'Apples', yield: 22, annual: false)
        expect(Crop.partial_name_search("Apple")).to eq([@crop3, crop4])
        expect(Crop.partial_name_search("Bea")).to eq([@crop2])
        expect(Crop.partial_name_search("z")).to eq([])
        expect(Crop.partial_name_search("S")).to eq([@crop1, @crop2, @crop3, crop4])
      end
    end
  end
end
