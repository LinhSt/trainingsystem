# gem faker.different of create! and create method is it raises an exception for
# an invalid user instead return false. makes debugger easier than silent errors
User.create!(
  name:  "Huynh Thanh Tung", email: "thanhtungcnttk13@gmail.com", password: "123456",
  password_confirmation: "123456", admin: true, activated: true,
  activated_at: Time.zone.now
)
User.create!(
  name:  "Linh Nguyen", email: "linhnguyencmu@gmail.com", password: "123456",
  password_confirmation: "123456", admin: true, activated: true,
  activated_at: Time.zone.now
)
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
    name: name, email: email, password: password,
    password_confirmation: password, activated: true, activated_at: Time.zone.now
  )
end
