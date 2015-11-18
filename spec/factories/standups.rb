# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :standup do
    yesterday "MyText"
    today "MyText"
    conflicts "MyText"
    channel nil
    user nil
    order 1
    state "MyString"
  end
end
