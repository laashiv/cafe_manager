class Order < ActiveRecord::Base
  has_many :order_items

  def is_pending?
    if self.delivered_at
      return "false"
    else
      return "true"
    end
  end

  def self.delivered
    all.where("delivered_at = ?", true)
  end
end
