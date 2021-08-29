# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

require 'rails_helper'

RSpec.describe 'destroying a farm' do
  before :each do
    @farm1 = Farm.create!(name: "Schrute Farms", acres: 40, organic: true)
    @farm2 = Farm.create!(name: "Old MacDonald's", acres: 100, organic: false)
    @crop1 = @farm1.crops.create!(name: 'Tomatoes', yield: 30, annual: true)
    @crop2 = @farm2.crops.create!(name: 'Beans', yield: 65, annual: true)
    @crop3 = @farm1.crops.create!(name: 'Peaches', yield: 25, annual: false)
  end

  it "can delete the crop from the index page" do
    visit "/crops/#{@crop1.id}"

    click_button("Delete Tomatoes")

    expect(current_path).to eq('/crops')
    expect(page).to_not have_content("Tomatoes")
  end
end
