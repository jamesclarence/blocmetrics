require 'faker'

# Create Users
10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8) 
    )
end

# Create Registered Applications
25.times do
  registered_application = Registered_Application.new(
    name: Faker::App.name,
    url: Faker::Internet.url,
    user: User.all.sample
    )
end

# Create Events
75.times do
    event = Event.new(
        name: Faker::Hacker.noun,
        count: Faker::Number.between(1, 100),
        registered_application: Registered_Application.all.sample
        )
end



# Create an admin
admin = User.new(
    name:       'Admin User',
    email:      'admin@example.com',
    password:   'helloworld',
    role:       'admin'
)
admin.skip_confirmation!
admin.save!

# Create a member
member = User.new(
    email:      'member@example.com',
    password:   'helloworld'
)
member.skip_confirmation!
member.save!
