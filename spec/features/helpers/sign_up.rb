def sign_up(email = "alice@example.com",
              user_name = "SuperMan",
              name = "Jimbo Jones",
              password = "oranges!",
              password_confirmation = "oranges!")
  visit '/user/new'
  fill_in :email, :with => email
  fill_in :user_name, :with => user_name
  fill_in :name, :with => name
  fill_in :password, :with => password
  fill_in :password_confirmation, :with => password_confirmation
  click_button "Sign up"
end

