FactoryBot.define do
  factory :owner do
    name { 'owner1' }
    email { 'owner@o.com' }
    password { 'ownerpass' }
    password_confirmation { 'ownerpass' }
    company { 'owner.co' }
    tel { '0901234567' }
    postcode { '1234567' }
  end
  factory :owner2, class: Owner do
    name { 'user2' }
    email { 'user2@u.com' }
    password { 'userpass2' }
    password_confirmation { 'userpass2' }
  end
end
