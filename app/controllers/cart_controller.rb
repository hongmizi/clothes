class CartController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_cart
  def show
  end

  def update
    listing = Listing.find_by_id params[:listing]
    quantity = params[:quantity]

    if listing == nil
      return render text: "Can't find the product!", status:400
    end
    if listing.can_order?(quantity) == false
      return render text: "Don't have so much product!", status:400
    end

    @cart.line_items.new listing: listing.id, quantity: quantity
  end

  private
  def load_cart
    @cart = current_user.cart
    @cart ||= current_user.build_cart
  end
end
