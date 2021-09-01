class Crop < ApplicationRecord
  belongs_to :farm

  def self.only_annuals
    Crop.where(annual: true)
  end

  def self.alphabatize_crops
    Crop.order(Arel.sql('LOWER(name)'))
  end

  def self.yield_threshold(num)
    Crop.where("yield > #{num}")
  end

  def self.exact_name_search(search)
    where("name = '#{search}'")
  end

  def self.partial_name_search(search)
    where("LOWER(name) LIKE ?", "%#{search.downcase}%")
  end
end
