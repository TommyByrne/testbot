# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :setting do
    channel_type "MyString"
    name "MyString"
    bot_id 1
    bot_name "MyString"
    web_url "MyString"
  end
end
