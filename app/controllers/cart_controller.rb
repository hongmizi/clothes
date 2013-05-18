class CartController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_cart

  def show
  end

  def add_line_item
    listing = Listing.find_by_id params[:listing_id]
    quantity = params[:quantity]

    if listing == nil
      return redirect_to :back, alert: "Please select a type"
    end

    if listing.can_order?(quantity) == false
      return redirect_to :back, alert:"sorry, we don't have so much product.."
    end
    
    if params[:listing_id].nil?
      return  redirect_to :back, alert: "Plase select a type"
    end

    @cart.line_items.new listing_id: listing.id, quantity: quantity, price:listing.price

    if @cart.save
      redirect_to :back, notice:"Successful!"
    else
      redirect_to :back, alert: @cart.errors.full_messages
    end
  end

  def remove_line_item
    line_item = @cart.line_items.find_by_id(params[:line_item_id])

    if @cart.nil?
      return redirect_to :back, alert: "Can't find the product!"
    end

    if line_item.destroy
      redirect_to :back, notice:"Rmove Successful!"
    else
      redirect_to :back, alert: line_item.errors.full_messages
    end
  end

  private
  def load_cart
    @cart = current_user.cart
    @cart ||= current_user.build_cart
  end
end
