# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user_id 1
    product_id 1
    quantity 1
    address "MyText"
    message "MyText"
  end
end
