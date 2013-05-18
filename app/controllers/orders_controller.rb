class OrdersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @orders = current_user.orders.all
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @order = current_user.orders.new
  end

  def edit
    @order = current_user.orders.find(params[:id])
  end

  def create
    @order = current_user.orders.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { redirect_to :back, alert:@order.errors.full_messages.map(&:to_s) }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
end
