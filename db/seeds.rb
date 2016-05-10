# Create Users
28.times do
  User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password(16, 32, true, true)
  )
end

demoUser = User.create!(
  email: 'demo@blocmetrics.com',
  password: 'blocmetrics',
  confirmed_at: Date.today
  )
  
users = User.all


# Create Applications

100.times do
  Application.create!(
    user: users.sample,
    name: Faker::App.name,
    url: Faker::Internet.url('example.com')
    )
end

applications = Application.all

# Create Events

250.times do
  Event.create!(
    application: applications.sample,
    name: Faker::Hipster.sentence(2)
    )
end

puts "Seed finished!"
puts "#{User.count} Users created"
puts "#{Application.count} Applications created"
puts "#{Event.count} Events created"