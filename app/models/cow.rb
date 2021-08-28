class Cow < ApplicationRecord
  belongs_to :ranch

  def self.all_grass_fed
    Cow.where(grass_fed: true)
  end
end
