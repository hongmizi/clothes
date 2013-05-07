class CartController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_card
  def show
  end
  private
  def load_card
    @card = current_user.card
    @card ||= current_user.card.create
  end
end
