class MenuItem < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :category, presence: true
  validates :price, presence: true

  def self.sort_items
    all.order(:name)
  end
end
