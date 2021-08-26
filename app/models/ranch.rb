class Ranch < ApplicationRecord
  has_many :cows

  def cows_count
    cows.count
  end
end
