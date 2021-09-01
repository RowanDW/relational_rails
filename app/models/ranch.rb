class Ranch < ApplicationRecord
  has_many :cows, dependent: :destroy

  def cows_count
    cows.count
  end

  def self.order_created_at_desc
    order(created_at: :desc)
  end

  def self.sort_by_num
    left_joins(:cows).
    group(:id).
    order("cows.count DESC")
  end

  def self.exact_name(name)
    Ranch.where(name: name)
  end
end
