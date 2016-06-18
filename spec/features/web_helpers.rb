def create_user
  User.create(
    username: USERS.first[:username],
    name: USERS.first[:name],
    email: USERS.first[:email],
    password: "password123",
    password_confirm: "password123"
  )
end

def log_in
  visit("/user/login")
  fill_in(:username, with: USERS.first[:username])
  fill_in(:password, with: "password123")
  click_button(:"Log In")
end
