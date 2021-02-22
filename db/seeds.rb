# User
20.times do |n|
  n += 1
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               id: n,
               )
end

# # Owner
20.times do |n|
  n += 1
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
               id: n
               )
end

# Shop
20.times do |n|
  n += 1
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
               owner_id: n,
               url: "",
               contact_detail: "05012345678",
               id: n
               )
end

# Review
20.times do |n|
  n += 1
  content = Faker::Restaurant.review
  Review.create!(content: content,
                shop_id: n,
                user_id: n,
                )
end

10.times do |n|
  n += 1
  m += 2
  content = Faker::JapaneseMedia::StudioGhibli.quote
  Review.create!(content: content,
                shop_id: n,
                user_id: m,
                )
end
