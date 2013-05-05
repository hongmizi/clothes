# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :line_item do
    listing_id 1
    order_id 1
    price 1
    quantity 1
    message "MyText"
  end
end
