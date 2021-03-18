FactoryBot.define do
  factory :review do
    content { 'good shop' }
    score {4}
  end
  factory :review2, class: Review do
    content { 'nice location' }
    score {3}
  end
  factory :review3, class: Review do
    content { 'lovely!' }
    score {5}
  end
end
