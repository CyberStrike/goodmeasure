# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_blocker do
    user nil
    blocker nil
    active false
  end
end
