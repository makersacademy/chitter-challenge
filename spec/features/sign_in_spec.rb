# feature 'Signing IN' do
#   scenario 'user can sign in' do
#     User.create(username: 'test_user', email: 'test@example.com', password: 'password123', name: 'test name')

#     # Then sign in as them
#     visit '/'
#     click_button 'Sign In'
#     fill_in('username', with: 'test_user')
#     fill_in('password', with: 'password123')
#     click_button('Submit')

#     expect(page).to have_selector(:link_or_button, 'Sign Out')
#   end

#   scenario 'user sees an error if they get their username wrong' do
#     User.create(username: 'test_user', email: 'test@example.com', password: 'password123', name: 'test name')

#     visit '/'
#     click_button 'Sign In'
#     fill_in(:username, with: 'test_aasuser')
#     fill_in(:password, with: 'password123')
#     click_button('Submit')

#     expect(page).not_to have_selector(:link_or_button, 'Sign Out')
#   end

#   scenario 'user sees an error if they get their password wrong' do
#     User.create(username: 'test_user', email: 'test@example.com', password: 'password123', name: 'test name')

#     visit '/'
#     click_button 'Sign In'
#     fill_in(:username, with: 'test_user')
#     fill_in(:password, with: 'passwo23')
#     click_button('Submit')

#     expect(page).not_to have_selector(:link_or_button, 'Sign Out')
#   end
# end
