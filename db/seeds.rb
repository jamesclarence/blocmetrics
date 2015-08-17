# Create a member
member = User.new(
    email:      'member@example.com',
    password:   'helloworld'
)
member.skip_confirmation!
member.save!
