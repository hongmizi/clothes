class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    render text: @listing.stock
  end
end

