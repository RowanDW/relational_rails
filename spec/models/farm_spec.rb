require 'rails_helper'

RSpec.describe Farm do
  it {should have_many :crops}

  describe 'instance methods' do
    describe '#crops_count' do
      before :each do
        @farm1 = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
        @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
        @farm3 = Farm.create!(name: "Farmy Farm", acres: 120, organic: true)
        @crop1 = @farm1.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
        @crop2 = @farm2.crops.create!(name: 'Beans', yield: 65, annual: true)
        @crop3 = @farm1.crops.create!(name: 'Peaches', yield: 25, annual: false)
      end

      it 'counts the number of crops a farm has' do
        expect(@farm1.crops_count).to eq(2)
        expect(@farm2.crops_count).to eq(1)
        expect(@farm3.crops_count).to eq(0)
      end
    end
  end

  describe 'class methods' do
    describe '#order_desc_created_at' do
      before :each do
        @farm1 = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
        @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
        @farm3 = Farm.create!(name: "Farmy Farm", acres: 120, organic: true)
      end

      it 'can order farms in descending order' do
        expect(Farm.order_desc_created_at).to eq([@farm3, @farm2, @farm1])
      end
    end
  end
end
