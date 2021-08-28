class Crop < ApplicationRecord
  belongs_to :farm

  def self.only_annuals
    Crop.where(annual: true)
  end
end
