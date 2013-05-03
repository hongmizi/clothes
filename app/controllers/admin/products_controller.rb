class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :ensure_user_is_admin, :except => [:show, :index]

  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end


  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private
  def ensure_user_is_admin
    authorize! :manage, :all
  end
end
