feature '#Homepage' do
  scenario 'Loads the default homepage when taken to /' do
    visit '/feed'
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature '#Add Peep' do
  scenario 'Adds a peep' do
    visit '/feed'
    fill_in('add_peep', with: 'Hello World!')
    click_button('Peep!')
    expect(page).to have_content "Hello World!"
  end
end

# feature '#Add_User' do
#   scenario 'Adds a user' do
#     visit '/feed'
#     click_button('Register!')
#     fill_in('add_email', with: 'testingemail@hotmail.com')
#     fill_in('add_password', with: 'testingpassword')
#     click_button('Register')
#     # Change this when I add "Welcome User" message
#     expect(page).to have_content "Welcome to Chitter!"
#   end
#
#   scenario 'Cancel adding user' do
#       visit '/feed'
#       click_button('Register!')
#       click_button('Cancel')
#       expect(page).to have_current_path('/login')
#       expect(page).to have_content "Welcome to Chitter!"
#   end
# end

# # feature '#Login' do
# #   scenario 'Feed on successful login' do
# #     visit '/'
# #     fill_in('add_email', with: 'admin@hotmail.com')
# #     fill_in('add_password', with: 'password')
# #     click_button('Login')
# #     expect(page).to have_current_path('/feed')
# #     # Implement this feature
# #     # expect(page).to have_contents "Welcome back to Chitter, Admin!"
# #   end
# end
