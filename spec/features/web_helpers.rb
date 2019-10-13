# Test account details
email = 'test@example.com'
password = 'pass123'
name = 'Melvin Lau'
username = 'melvinlau'

# Create a user in the database
user = User.create(
  email: email,
  password: password,
  name: name,
  username: username
)

# Test peep content
content = "Hello world! Whassup y'all?"

def sign_in
  visit '/'
  within('div.sign-in') do
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign In'
  end
end

def create_peep
  Peep.create(content: content, user_id: user.id)
end
