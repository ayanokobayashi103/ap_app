FactoryBot.define do
  factory :review do
    content { 'good shop' }
  end
  factory :review2, class: Review do
    content { 'nice location' }
  end
end
