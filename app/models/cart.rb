class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user

  def increment_no_of_items(current_user)
    cart = current_user.cart
    cart.update_column(:no_of_items, cart.no_of_items + 1)
  end

  def decrement_no_of_items(current_user)
    cart = current_user.cart
    cart.update_column(:no_of_items, cart.no_of_items - 1)
  end

  def increment_total(item_price, current_user)
    cart = current_user.cart
    cart.update_column(:total, cart.total + item_price)
  end

  def decrement_total(item_price, quantity, current_user)
    cart = current_user.cart
    cart.update_column(:total, cart.total - (item_price * quantity))
  end
end
