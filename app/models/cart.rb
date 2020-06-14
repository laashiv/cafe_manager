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

  def update_cart(current_user)
    cart = current_user.cart
    cart_items = cart.cart_items
    mitem_ids = Menu.active_menu.link_menu_items.map { |item| item.menu_item_id }
    mitems = MenuItem.where(id: mitem_ids)
    cart_items.each do |citem|
      menu_item = mitems.find_by(id: citem.menu_item_id)
      if (menu_item)
        citem.update_column(:menu_item_price, menu_item.price)
      else
        citem.destroy
        cart.decrement_total(citem.menu_item_price, citem.quantity, current_user)
        cart.decrement_no_of_items(current_user)
      end
    end
  end
end
