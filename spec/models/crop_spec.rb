require 'rails_helper'

RSpec.describe Crop do
  it {should belong_to :farm}

  describe 'class methods' do
    describe '#only_annuals' do
      before(:each) do
        @farm = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
        @crop1 = @farm.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
        @crop2 = @farm.crops.create!(name: 'Beans', yield: 65, annual: true)
        @crop3 = @farm.crops.create!(name: 'Apples', yield: 22, annual: false)
      end
      it 'only returns crops where annual is true' do
        expect(Crop.only_annuals).to eq([@crop1, @crop2])

        @crop4 = @farm.crops.create!(name: 'Plums', yield: 5, annual: false)
        @crop5 = @farm.crops.create!(name: 'Potatoes', yield: 60, annual: true)

        expect(Crop.only_annuals).to eq([@crop1, @crop2, @crop5])
      end
    end
  end
end
