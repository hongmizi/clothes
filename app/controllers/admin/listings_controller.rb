class Admin::ListingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin
  before_filter :load_product, only: [:create]
  before_filter :load_listing, only: [:update, :destroy]

  def create
    
    @product.listings.new types: params[:types], stock: params[:stock], price: params[:price]
    
    if @product.save
      return redirect_to :back, notice: "success!"
    else
      return redirect_to :back, alert: @product.errors.full_messages
    end
  end

  def update
    @listing.types = params[:types] if params[:types]
    @listing.stock = params[:stock] if params[:stock]
    if @listing.save
      return redirect_to :back, notice: "success!"
    else
      return redirect_to :back, alert: "failed!"
    end
  end

  def destroy
    if @listing.destroy
       return redirect_to :back, notice: "success!"
    else
      return redirect_to :back, alert: "failed!"
    end
  end

  private
  def ensure_user_is_admin
    authorize! :manage, :all
  end
  
  def load_listing
    @listing = Listing.find_by_id params[:listing]
    if @listing.nil?
      return redirect_to :back, alert:"Can't find the listing!"
    end
  end

  def load_product
    @product = Product.find_by_id(params[:product_id])
    if @product.nil?
      redirect_to :back, alert:"Failed to load product!" and return
    end
  end
end
