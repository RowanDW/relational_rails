require 'rails_helper'

RSpec.describe 'Ranch editing' do
  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
  end

  it 'links to all child indexes' do
    visit "/ranches/#{@ranch_1.id}/edit"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/ranches/#{@ranch_1.id}/edit"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/ranches/#{@ranch_1.id}/edit"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/ranches/#{@ranch_1.id}/edit"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'links to the edit page' do
    visit "/ranches/#{@ranch_1.id}"

    click_button("Edit Fernando's Fine Bovines")

    expect(current_path).to eq("/ranches/#{@ranch_1.id}/edit")
  end

  it 'can edit the ranch' do
    visit "/ranches/#{@ranch_1.id}"

    expect(page).to have_content("Fernando's Fine Bovines")

    click_button("Edit Fernando's Fine Bovines")

    fill_in("name",         with: "Fernando's Fabulous Bovines")
    fill_in("max_capacity", with: 50)
    check("certified_humane")

    click_button("Update Ranch")

    expect(current_path).to eq("/ranches/#{@ranch_1.id}")
    expect(page).to have_content("Fernando's Fabulous Bovines")
  end

  it 'is linked from the ranch index page' do
    visit "/ranches/"

    click_button("Edit Fernando's Fine Bovines")
    expect(current_path).to eq("/ranches/#{@ranch_1.id}/edit")

    visit "/ranches/"
    click_button("Edit Janie's Jolly Cow Corral")
    expect(current_path).to eq("/ranches/#{@ranch_2.id}/edit")
  end
end
