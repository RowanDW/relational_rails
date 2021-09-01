class Farm < ApplicationRecord
  has_many :crops, dependent: :destroy

  def crops_count
    crops.count
  end

  def self.order_created_at_desc
    order(created_at: :desc)
  end

  def self.order_crop_count
    left_joins(:crops).group(:id).order(Arel.sql('COUNT(crops) DESC'))
  end

  def self.exact_name_search(search)
    where("name = '#{search}'")
  end

  def self.partial_name_search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
