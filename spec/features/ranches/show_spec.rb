require 'rails_helper'

RSpec.describe 'the ranches show page' do
  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @cow_1 = @ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)
    @cow_2 = @ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)

    @ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
    @cow_3 = @ranch_2.cows.create!(name: "Spotty Sue", age: 3, grass_fed: false)
  end

  it 'displays the ranch and its attributes' do
    visit "/ranches/#{@ranch_1.id}"


    expect(page).to have_content("Fernando's Fine Bovines")
    expect(page).to have_content("Id: #{@ranch_1.id}")
    expect(page).to have_content("Max Capacity: 50")
    expect(page).to have_content("Certified Humane: true")
    expect(page).to have_content("Created at: #{@ranch_1.created_at}")
    expect(page).to have_content("Updated at: #{@ranch_1.updated_at}")

    expect(page).to_not have_content("Janie's Jolly Cow Corral")
  end

  it 'displays a count of children associated with this parent' do
    visit "/ranches/#{@ranch_1.id}"

    expect(page).to have_content("Number of Cows: 2")
  end

  it 'links to all child indexes' do
    visit "/ranches/#{@ranch_1.id}"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/ranches/#{@ranch_1.id}"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/ranches/#{@ranch_1.id}"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/ranches/#{@ranch_1.id}"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'links to ranch cows index page' do
    visit "/ranches/#{@ranch_1.id}"

    expect(page).to have_content("Visit Fernando's Fine Bovines's Cows")

    click_on "Visit Fernando's Fine Bovines's Cows"
    expect(current_path).to eq("/ranches/#{@ranch_1.id}/cows")
  end
end
