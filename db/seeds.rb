# User
20.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
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
               )
end

# Shop
20.times do |n|
  name = Faker::Mountain.name
  brand = Faker::Beer.brand
  address = Faker::Address.full_address
  detail = Faker::JapaneseMedia::StudioGhibli.quote
  Shop.create!(name: name,
               brand: brand,
               address: address,
               start_dt: "10:00",
               end_dt: "18:00",
               detail: detail,
               owner_id: Owner.find(n + 1).id,
               url: "",
               contact_detail: "05012345678",
               )
end

# Review
20.times do |n|
  content = Faker::Restaurant.review
  Review.create!(content: content,
                shop_id: Shop.find(n + 1).id,
                user_id: User.find(n + 1).id,
                score: rand(1..5),
                )
end

10.times do |n|
  content = Faker::JapaneseMedia::StudioGhibli.quote
  Review.create!(content: content,
                shop_id: Shop.find(n + 1).id,
                user_id: User.find(n + 1).id,
                score: rand(1..5),
                )
end
