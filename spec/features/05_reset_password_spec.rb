# feature '05. Resetting Password' do
#   before do
#     user_signup
#     Capybara.reset!
#   end
#   let(:user) { User.first }
#
#   scenario 'a) When I enter my email I am told to check my inbox' do
#     recover_password
#     expect(page).to have_content "Thanks, Please check your inbox for the link."
#   end
#
#   scenario 'b) Assigned a reset token to the user when they recover' do
#     user_signup
#     expect{recover_password}.to change{User.first.password_token}
#   end
#
#   scenario 'c) it doesn\'t allow you to use the token after an hour' do
#     recover_password
#     Timecop.travel(60 * 60 * 60) do
#       visit("/users/reset_password?token=#{user.password_token}")
#       expect(page).to have_content "Your token is invalid"
#     end
#   end
#
#   scenario 'd) it lets you enter a new password with a valid token' do
#     recover_password
#     set_password(password: "newpassword", password_confirmation: "newpassword")
#     expect(page).to have_content("Please sign in")
#   end
#
#   scenario 'e) it lets you sign in after password reset' do
#     recover_password
#     set_password(password: "newpassword", password_confirmation: "newpassword")
#     user_signin_new_password
#     expect(page).to have_content "Welcome, josepedrocastanheira@gmail.com"
#   end
#
#   scenario 'f) it lets you know if your passwords don\'t match' do
#     recover_password
#     set_password(password: "newpassword", password_confirmation: "wrongpassword")
#     expect(page).to have_content("Password does not match the confirmation")
#   end
#
#   scenario 'it immediately resets token upon successful password update' do
#     recover_password
#     set_password(password: "newpassword", password_confirmation: "newpassword")
#     visit("/users/reset_password?token=#{user.password_token}")
#     expect(page).to have_content("Your token is invalid")
#   end
#
#   def set_password(password:, password_confirmation:)
#     visit("/users/reset_password?token=#{user.password_token}")
#     fill_in :password, with: password
#     fill_in :password_confirmation, with: password_confirmation
#     click_button "Submit"
#   end
#
#   def recover_password
#     visit '/users/recover'
#     fill_in :email, with: "josepedrocastanheira@gmail.com"
#     click_button "Submit"
#   end
# end
