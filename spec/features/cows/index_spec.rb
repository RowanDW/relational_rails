require 'rails_helper'

RSpec.describe '#the cows index page' do
  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @cow_1 = @ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)
    @cow_2 = @ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)

    @ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
    @cow_3 = @ranch_2.cows.create!(name: "Spotty Sue", age: 3, grass_fed: false)
  end

  it 'links to all child indexes' do
    visit '/cows'

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit '/cows'

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit '/cows'

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit '/cows'

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'displays all cows with their attributes' do
    visit '/cows'

    expect(page).to have_content("Bessie Lou")
    expect(page).to have_content("Bobbie Jean")

    expect(page).to have_content("Age: 2")
    expect(page).to have_content("Age: 4")

    expect(page).to have_content("Grass fed?: true")

    expect(page).to have_content("Ranch id: #{@ranch_1.id}")

    expect(page).to have_content("Created at: #{@cow_1.created_at}")
    expect(page).to have_content("Created at: #{@cow_2.created_at}")

    expect(page).to have_content("Updated at: #{@cow_1.updated_at}")
    expect(page).to have_content("Updated at: #{@cow_2.updated_at}")
  end

  it 'links to each cows show page' do
    visit '/cows'

    click_on("Bessie Lou")
    expect(current_path).to eq("/cows/#{@cow_1.id}")

    visit '/cows'

    click_on("Bobbie Jean")
    expect(current_path).to eq("/cows/#{@cow_2.id}")
  end

  it 'only shows grass_fed cows' do
    visit '/cows'

    expect(page).to have_content("Bessie Lou")
    expect(page).to have_content("Bobbie Jean")
    expect(page).to_not have_content("Spotty Sue")
  end

  it 'can delete a cow' do
    visit "/cows"

    click_button("Delete Bessie Lou")
    expect(current_path).to eq("/cows")
    expect(page).to_not have_content("Bessie Lou")

    click_button("Delete Bobbie Jean")
    expect(page).to_not have_content("Bobbie Jean")
  end

  it 'has a search by name form' do
    visit "/cows"

    fill_in("exact_name", with: "Bessie Lou")
    click_button("Submit Exact Name")
    expect(current_path).to eq("/cows")
    expect(page).to have_content("Bessie Lou")
    expect(page).to_not have_content("Bobbie Jean")

    fill_in("exact_name", with: "Bessie")
    click_button("Submit Exact Name")
    expect(page).to_not have_content("Bessie Lou")
  end
end
