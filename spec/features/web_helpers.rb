def fill_sign_up_form
  visit "/signup"
  fill_in "user_name", with: "predator911"
  fill_in "name", with: "Jon Doe"
  fill_in "password", with: "callth3cops"
  fill_in "password_confirmation", with: "callth3cops"
  fill_in "email", with: "prodator911@mail.com"
end

def create_user
  User.create(user_name: "Ben09", name: "Ben", password: "1234",
              password_confirmation: "1234", email: "Ben09@gmail.com")
end

def sign_in
  create_user
  visit"/signin"
  fill_in "user_name", with: "Ben09"
  fill_in "password", with: "1234"
  click_button "Sign in"
end
