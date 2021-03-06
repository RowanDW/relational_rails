require 'rails_helper'

RSpec.describe Farm do
  it {should have_many :crops}

  describe 'instance methods' do
    before :each do
      @farm1 = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
      @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
      @farm3 = Farm.create!(name: "Farmy Farm", acres: 120, organic: true)
      @crop1 = @farm1.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
      @crop2 = @farm2.crops.create!(name: 'Beans', yield: 65, annual: true)
      @crop3 = @farm1.crops.create!(name: 'Peaches', yield: 25, annual: false)
    end

    describe '#crops_count' do
      it 'counts the number of crops a farm has' do
        expect(@farm1.crops_count).to eq(2)
        expect(@farm2.crops_count).to eq(1)
        expect(@farm3.crops_count).to eq(0)
      end
    end
  end

  describe 'class methods' do
    describe '#order_created_at_desc' do
      before :each do
        @farm1 = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
        @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
        @farm3 = Farm.create!(name: "Farmy Farm", acres: 120, organic: true)
      end

      it 'can order farms in descending order' do
        expect(Farm.order_created_at_desc).to eq([@farm3, @farm2, @farm1])
      end
    end

    describe '#order_crop_count' do
      before :each do
        @farm1 = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
        @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
        @farm3 = Farm.create!(name: "Farmy Farm", acres: 100, organic: false)
        @crop1 = @farm1.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
        @crop2 = @farm2.crops.create!(name: 'Beans', yield: 65, annual: true)
        @crop3 = @farm2.crops.create!(name: 'Apples', yield: 22, annual: false)
      end

      it 'orders farms by crop count desc' do
        expect(Farm.order_crop_count).to eq([@farm2, @farm1, @farm3])
      end
    end

    describe 'name_search' do
      before :each do
        @farm1 = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
        @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
        @farm3 = Farm.create!(name: "Farmy Farm", acres: 100, organic: false)
        @farm4 = Farm.create!(name: "Farmy Farm", acres: 100, organic: false)
      end

      it 'returns all farms with exact name matching' do
        expect(Farm.exact_name_search("Schrute Farms")).to eq([@farm1])
        expect(Farm.exact_name_search("Farmy Farm")).to eq([@farm3, @farm4])
      end

      it 'returns all farms with partial name matching' do
        expect(Farm.partial_name_search("Farm")).to eq([@farm1, @farm3, @farm4])
        expect(Farm.partial_name_search("Sch")).to eq([@farm1])
        expect(Farm.partial_name_search("cat")).to eq([])
        expect(Farm.partial_name_search("A")).to eq([@farm1, @farm2, @farm3, @farm4])
      end
    end
  end
end
