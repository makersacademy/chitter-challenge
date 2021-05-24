def sign_in_short_cut
  User.create(
    email: "name@example.com",
    name: "Willoughby Hood",
    username: "wh3g",
    password: "password123"
  )
  visit('/')
  click_button("Sign in")
  fill_in("email", with: "name@example.com")
  fill_in("password", with: "password123")
  click_button("Sign in")
end