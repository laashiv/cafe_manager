class Cart < ApplicationRecord
  has_many :cart_items

  def update_no_of_items(current_user)
    cart = Cart.find_by(user_id: current_user.id)
    cart.update_column(:no_of_items, cart.no_of_items + 1)
  end
end
