FactoryGirl.define do
  factory :question do |f|
    f.sequence(:text)  { |n| "#{n} + #{n} = ?" }
    f.sequence(:token) { |n| "#{n}" }
  end
end
