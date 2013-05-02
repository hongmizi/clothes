class OrdersController < ApplicationController
  before_filter :authenticate_user!
  # GET /orders
  def index
    @orders = current_user.orders.all
  end

  # GET /orders/1
  def show
    @order = current_user.orders.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = current_user.orders.new
    if params[:product_id]
      @product = Product.find params[:product_id]
    else
      redirect_to :back, alert:"please select a product!" and return
    end
  end

  # GET /orders/1/edit
  def edit
    @order = current_user.orders.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.new(params[:order])
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { redirect_to new_order_path(product_id:params[:product_id]), alert:@order.errors }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
=begin
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
=begin
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
=end
  end
end
