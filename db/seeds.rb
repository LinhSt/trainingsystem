# gem faker.different of create! and create method is it raises an exception for
# an invalid user instead return false. makes debugger easier than silent errors
require "faker"
User.delete_all
User.create!(
  name:  "Huynh Thanh Tung", email: "thanhtungcnttk13@gmail.com", password: "123456",
  password_confirmation: "123456", role: 0, activated: true,avatar: "logo.png",
  activated_at: Time.zone.now
)
User.create!(
  name:  "Linh Nguyen", email: "linhnguyencmu@gmail.com", password: "123456",
  password_confirmation: "123456", role: 0, activated: true, avatar: "ac.jpg",
  activated_at: Time.zone.now
)
User.create!(
  name:  "Test Nguyen", email: "test@gmail.com", password: "123456",
  password_confirmation: "123456", role: 1, activated: true, avatar: "logo.png",
  activated_at: Time.zone.now
)

99.times do |n|
  name  = Faker::LeagueOfLegends.champion
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
    name: name, email: email, password: password, role: 2,
    password_confirmation: password, activated: true, activated_at: Time.zone.now
  )
end
10.times do |n|
    name = Faker::LeagueOfLegends.rank
    description = Faker::LeagueOfLegends.quote
    status = 1
  Course.create!(
    name: name, description: description, start_time: "2017/09/01", end_time: "2017/10/30",
    status: status
    )
end
30.times do |n|
  name = Faker::LeagueOfLegends.masteries
  description = Faker::LeagueOfLegends.quote
  content = Faker::Lorem.sentence(3)
  Subject.create!(
    name: name, description: description, content: content
  )
end
