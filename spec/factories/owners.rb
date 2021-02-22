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
    name { 'owner2' }
    email { 'owner2@o.com' }
    password { 'ownerpass' }
    password_confirmation { 'ownerpass' }
    company { 'owner2.co' }
    tel { '0123456789' }
    postcode { '1540007' }
  end
end
