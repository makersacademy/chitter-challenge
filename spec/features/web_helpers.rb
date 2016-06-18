require './data/peeps'
require './data/users'

def log_in
  visit("/user/login")
  fill_in(:username, with: "vannio")
  fill_in(:password, with: "password123")
  click_button(:"Log In")
end


def create_users
  USERS.each do |user|
    User.create(
      username: user[:username],
      name: user[:name],
      email: user[:email],
      password: "password123",
      password_confirm: "password123"
    )
  end
end

def generate_peeps
  PEEPS.each do |peep|
    Peep.create(
      text: peep[:text],
      timestamp: Time.now - (3600 * peep[:time_offset]),
      user: User.first(username: peep[:username])
    )
  end
end
