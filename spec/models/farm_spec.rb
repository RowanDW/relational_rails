require 'rails_helper'

RSpec.describe Farm do
  it {should have_many :crops}

  describe 'instance methods' do
    describe '#order_by_creation_desc' do

      # before :each do
      #   @farm = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
      #   @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
      #   @farm3 = Farm.create!(name: "Farmy Farm", acres: 200, organic: true)
      # end
      # it 'orders the farms by most recently created desc' do
      #   expect(Farm.all.order_by_creation_desc).to eq([@farm3, @farm2, @farm])
      # end
    end
  end
end
