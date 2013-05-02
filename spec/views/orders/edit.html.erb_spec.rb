require 'spec_helper'

describe "orders/edit" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :user_id => 1,
      :product_id => 1,
      :quantity => 1,
      :address => "MyText",
      :message => "MyText"
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_path(@order), "post" do
      assert_select "input#order_user_id[name=?]", "order[user_id]"
      assert_select "input#order_product_id[name=?]", "order[product_id]"
      assert_select "input#order_quantity[name=?]", "order[quantity]"
      assert_select "textarea#order_address[name=?]", "order[address]"
      assert_select "textarea#order_message[name=?]", "order[message]"
    end
  end
end
