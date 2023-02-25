FactoryBot.define do
  factory :post do
    association :user

    title { 'Anything' }
    content { 'Lorem ipsum Lorem ipsum Lorem ipsum' }
  end
end
