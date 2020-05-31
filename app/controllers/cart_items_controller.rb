class CartItemsController < ApplicationController
  def index
    @cart = cart
    render "index"
  end
end
