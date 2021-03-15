# User
20.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               id: "#{n + 1}",
               )
end

# # Owner
20.times do |n|
  name = Faker::Artist.name
  email = Faker::Internet.email
  password = "password"
  company = Faker::Company.name
  tel = "0123456789"
  postcode = "1234567"
  Owner.create!(name: name,
               email: email,
               password: password,
               company: company,
               tel: tel,
               postcode: postcode,
               id: "#{n + 1}"
               )
end

# Shop
20.times do |n|
  name = Faker::Book.title
  brand = Faker::Beer.brand
  address = Faker::Address.full_address
  detail = Faker::JapaneseMedia::StudioGhibli.quote
  Shop.create!(name: name,
               brand: brand,
               address: address,
               start_dt: "10:00",
               end_dt: "18:00",
               detail: detail,
               owner_id: "#{n + 1}",
               url: "",
               contact_detail: "05012345678",
               id: "#{n + 1}"
               )
end

# Review
20.times do |n|
  content = Faker::Restaurant.review
  Review.create!(content: content,
                shop_id: "#{n + 1}",
                user_id: "#{n + 1}",
                rate: rand(5)
                )
end

10.times do |n|
  content = Faker::JapaneseMedia::StudioGhibli.quote
  Review.create!(content: content,
                shop_id: "#{n + 1}",
                user_id: "#{n + 2}",
                )
end
