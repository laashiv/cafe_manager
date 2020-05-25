class MenuItem < ApplicationRecord
  def self.sort
    all.order(:name)
  end
end
