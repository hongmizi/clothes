class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_is_admin
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to admin_path, notice:"success!" and return
    else
      redirect_to :back, alert:@product.errors.full_messages and return
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if params[:product][:image]
      uploaded_io = params[:product][:image]
      
      path = Rails.root.join('public', 'uploads', 'products_image')
      FileUtils.mkdir_p(path) unless File.exists?(path)

      File.open(path + @product.id.to_s, 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end

    @product.title = params[:product][:title]
    @product.description = params[:product][:description]
    @product.image_url = "/uploads/products_image/#{@product.id}"
    respond_to do |format|
      if @product.save
        format.html { redirect_to :back, notice: 'Product was successfully updated.' }
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
