def fill_sign_up_form
  visit "/signup"
  fill_in "user_name", with: "predator911"
  fill_in "name", with: "Jon Doe"
  fill_in "password", with: "callth3cops"
  fill_in "password_confirmation", with: "callth3cops"
  fill_in "email", with: "prodator911@mail.com"
end
