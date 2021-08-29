require 'rails_helper'

RSpec.describe 'Ranches cows index' do
  before(:each) do
    @ranch_1 = Ranch.create!(name: "Fernando's Fine Bovines", max_capacity: 50, certified_humane: true)
    @cow_2 = @ranch_1.cows.create!(name: "Bobbie Jean", age: 4, grass_fed: true)
    @cow_1 = @ranch_1.cows.create!(name: "Bessie Lou", age: 2, grass_fed: true)

    @ranch_2 = Ranch.create!(name: "Janie's Jolly Cow Corral", max_capacity: 80, certified_humane: false)
    @cow_3 = @ranch_2.cows.create!(name: "Spotty Sue", age: 3, grass_fed: false)
  end

  it 'displays all cows for the artist with their attributes' do
    visit "/ranches/#{@ranch_1.id}/cows"

    expect(page).to have_content("Fernando's Fine Bovines")

    expect(page).to have_content("Name: Bessie Lou")
    expect(page).to have_content("Age: 2")
    expect(page).to have_content("Grass fed?: true")
    expect(page).to have_content("Ranch id: #{@ranch_1.id}")
    expect(page).to have_content("Created at: #{@cow_1.created_at}")
    expect(page).to have_content("Updated at: #{@cow_1.updated_at}")

    expect(page).to have_content("Name: Bobbie Jean")
    expect(page).to have_content("Age: 4")
    expect(page).to have_content("Grass fed?: true")
    expect(page).to have_content("Ranch id: #{@ranch_1.id}")
    expect(page).to have_content("Created at: #{@cow_2.created_at}")
    expect(page).to have_content("Updated at: #{@cow_2.updated_at}")

    expect(page).to_not have_content("Spotty Sue")
  end

  it 'links to all child indexes' do
    visit "/ranches/#{@ranch_1.id}/cows"

    expect(page).to have_content("Crops Index")
    expect(page).to have_content("Cows Index")

    click_on "Crops Index"
    expect(current_path).to eq("/crops")

    visit "/ranches/#{@ranch_1.id}/cows"

    click_on "Cows Index"
    expect(current_path).to eq("/cows")
  end

  it 'links to all parent indexes' do
    visit "/ranches/#{@ranch_1.id}/cows"

    expect(page).to have_content("Farms Index")
    expect(page).to have_content("Ranches Index")

    click_on "Farms Index"
    expect(current_path).to eq("/farms")

    visit "/ranches/#{@ranch_1.id}/cows"

    click_on "Ranches Index"
    expect(current_path).to eq("/ranches")
  end

  it 'has a link to sort the cows' do
    visit "/ranches/#{@ranch_1.id}/cows"
    expect("Bobbie Jean").to appear_before("Bessie Lou")

    click_on("Sort Cows")

    expect(current_path).to eq("/ranches/#{@ranch_1.id}/cows")
    expect("Bessie Lou").to appear_before("Bobbie Jean")
  end

  it 'has a form to filter cows over input age' do
    visit "/ranches/#{@ranch_1.id}/cows"

    fill_in("age_threshold",  with: 2)
    click_button("Only return cows older than input age")
    expect(current_path).to eq("/ranches/#{@ranch_1.id}/cows")

    expect(page).to have_content("Bobbie Jean")
    expect(page).to_not have_content("Bessie Lou")
  end
end

# As a visitor
# When I visit the Parent's children Index Page
# I see a form that allows me to input a number value
# When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
# Then I am brought back to the current index page with only the records that meet that threshold shown.
