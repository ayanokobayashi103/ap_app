FactoryBot.define do
  factory :comment do
    review { 'great!' }
    content { 'MyText' }
  end
end
