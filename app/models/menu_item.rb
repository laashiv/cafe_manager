class MenuItem < ApplicationRecord
  def self.sort_items
    all.order(:name)
  end
end
