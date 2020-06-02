class MenuItem < ApplicationRecord
  has_one_attached :image

  def self.sort_items
    all.order(:name)
  end
end
