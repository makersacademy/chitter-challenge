require 'timecop'

feature 'Generating Token for Password Reset' do

before do
  sign_up
  Capybara.reset!
end
let(:user) { User.first }

scenario 'it doesn\'t allow you to use the token after an hour' do
  recover_password
  Timecop.travel(60 * 60 * 60) do
    visit("/users/reset_password?token=#{user.password_token}")
    expect(page).to have_content "Your token is invalid"
  end
end

scenario 'it asks for your new password when your token is valid' do
   recover_password
   visit("/users/reset_password?token=#{user.password_token}")
   expect(page).to have_content("Please enter your new password")
end

def recover_password
  visit '/users/recover'
  fill_in :email, with: "alice@example.com"
  click_button "Submit"
end

scenario 'it lets you enter a new password with a valid token' do
  recover_password
  visit("/users/reset_password?token=#{user.password_token}")
  fill_in :password, with: "newpassword"
  fill_in :password_confirmation, with: "newpassword"
  click_button "Submit"
  expect(page).to have_content("Please sign in")
end

scenario 'it lets you sign in after password reset' do
   recover_password
   visit("/users/reset_password?token=#{user.password_token}")
   fill_in :password, with: "newpassword"
   fill_in :password_confirmation, with: "newpassword"
   click_button "Submit"
   sign_in(email: "alice@example.com", password: "newpassword")
   expect(page).to have_content "Welcome, alice@example.com"
end

scenario 'it lets you know if you\'re passwords don\'t match' do
   recover_password
   visit("/users/reset_password?token=#{user.password_token}")
   fill_in :password, with: "newpassword"
   fill_in :password_confirmation, with: "wrongpassword"
   click_button "Submit"
   expect(page).to have_content("Password does not match the confirmation")
 end
end
