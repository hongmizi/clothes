# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    product_id 1
    color "MyString"
    size "MyString"
    stock 1
  end
end
