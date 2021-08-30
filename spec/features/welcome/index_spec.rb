require 'rails_helper'

RSpec.describe 'welcome page' do
  describe 'nav links' do
    it 'links to all child indexes' do
      visit "/"

      expect(page).to have_content("Crops Index")
      expect(page).to have_content("Cows Index")

      click_on "Crops Index"
      expect(current_path).to eq("/crops")

      visit "/"

      click_on "Cows Index"
      expect(current_path).to eq("/cows")
    end

    it 'links to all parent indexes' do
      visit "/"

      expect(page).to have_content("Farms Index")
      expect(page).to have_content("Ranches Index")

      click_on "Farms Index"
      expect(current_path).to eq("/farms")

      visit "/"

      click_on "Ranches Index"
      expect(current_path).to eq("/ranches")
    end
  end

  describe 'content' do
    it 'has a welcome message' do
      visit "/"

      expect(page).to have_content("Welcome to Our Project - Please Click Above")
    end
  end
end
