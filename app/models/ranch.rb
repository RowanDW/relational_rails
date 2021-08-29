class Ranch < ApplicationRecord
  has_many :cows, dependent: :destroy

  def cows_count
    cows.count
  end

  def self.order_created_at_desc
    order(created_at: :desc)
  end
end
