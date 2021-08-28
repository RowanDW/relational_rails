class Cow < ApplicationRecord
  belongs_to :ranch

  def self.all_grass_fed
    Cow.where(grass_fed: true)
  end

  def self.sort_by_name
    Cow.order(:name)

    # Cow.all.sort_by do |cow|
    #   cow.name.downcase
    # end
  end
end
