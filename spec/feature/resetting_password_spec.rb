# feature "reset password" do
#
#   scenario 'it lets you enter a new password with a valid token' do
#     recover_password
#     visit("/makers/reset_password?token=#{maker.password_token}")
#     fill_in :password, with: "newpassword"
#     fill_in :password_confirmation, with: "newpassword"
#     click_button "Submit"
#     expect(page).to have_content("Please sign in")
#   end
#
#   scenario 'it lets you sign in after password reset' do
#    recover_password
#    visit("/makers/reset_password?token=#{maker.password_token}")
#    fill_in :password, with: "newpassword"
#    fill_in :password_confirmation, with: "newpassword"
#    click_button "Submit"
#    sign_in(email: "olivia@example.com", password: "newpassword")
#    expect(page).to have_content "Welcome, olivia@example.com"
#   end
#
#   scenario 'it lets you know if your passwords don\'t match' do
#    recover_password
#    visit("/makers/reset_password?token=#{maker.password_token}")
#    fill_in :password, with: "newpassword"
#    fill_in :password_confirmation, with: "wrongpassword"
#    click_button "Submit"
#    expect(page).to have_content("Password does not match the confirmation")
#  end
#
#  scenario 'it immediately resets token upon successful password update' do
#     recover_password
#     set_password(password: "newpassword", password_confirmation: "newpassword")
#     visit("/makers/reset_password?token=#{maker.password_token}")
#     expect(page).to have_content("Your token is invalid")
#   end
# end
