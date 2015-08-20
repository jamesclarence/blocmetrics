require 'faker'

# Create Users
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    role: 'standard' 
    )
    user.skip_confirmation!
    user.save!
end

# Create Registered Applications
25.times do
  registered_application = RegisteredApplication.create(
    name: Faker::App.name,
    url: Faker::Internet.url,
    user: User.all.sample
    )
end

# Create Events
150.times do
    event = Event.create(
        name: Faker::Hacker.noun,
        count: Faker::Number.between(1, 100),
        registered_application: RegisteredApplication.all.sample
        )
end

# Create an admin
admin = User.new(
    email:      'admin@example.com',
    password:   'helloworld',
    role:       'admin'
)
admin.skip_confirmation!
admin.save!

# Create a member
member = User.new(
    email:      'member@example.com',
    password:   'helloworld',
    role:       'standard'
)
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"