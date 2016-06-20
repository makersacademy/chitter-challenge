def create_user
  User.create(
    username: "vannio",
    name: "Van",
    email: "van@email.com",
    password: "password123",
    password_confirm: "password123"
  )
end

def log_in
  visit("/sessions/new")
  fill_in(:username, with: "vannio")
  fill_in(:password, with: "password123")
  click_button(:"Log In")
end
