# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    sender nil
    receiver nil
    notifiable nil
    unread false
  end
end
