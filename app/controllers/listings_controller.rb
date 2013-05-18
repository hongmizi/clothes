class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    render json: {stock: @listing.stock, price: @listing.price}
  end
end

