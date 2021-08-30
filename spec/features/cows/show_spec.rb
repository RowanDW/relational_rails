require 'rails_helper'

RSpec.describe 'the cows show page' do
  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @cow_1 = @ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)
    @cow_2 = @ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)
  end

  it 'links to all child indexes' do
    visit "/cows/#{@cow_1.id}"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/cows/#{@cow_1.id}"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/cows/#{@cow_1.id}"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/cows/#{@cow_1.id}"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'displays the cow and its attributes' do
    visit "/cows/#{@cow_1.id}"

    expect(page).to have_content("Bessie Lou")
    expect(page).to have_content("Age: 2")
    expect(page).to have_content("Grass fed?: true")
    expect(page).to have_content("Ranch id: #{@ranch_1.id}")
    expect(page).to have_content("Created at: #{@cow_1.created_at}")
    expect(page).to have_content("Updated at: #{@cow_1.updated_at}")

    expect(page).to_not have_content("Bobbie Jean")
  end

  it 'links to all child indexes' do
    visit "/cows/#{@cow_1.id}"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/cows/#{@cow_1.id}"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/cows/#{@cow_1.id}"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/cows/#{@cow_1.id}"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'can delete a cows' do
    visit "/cows/#{@cow_1.id}"

    click_button("Delete Bessie Lou")
    expect(current_path).to eq("/cows")
    expect(page).to_not have_content("Bessie Lou")
  end
end
