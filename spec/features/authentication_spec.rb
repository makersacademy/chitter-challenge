# feature 'Authentication' do
#   scenario 'user can sign in with the right email and password' do
#     User.create(name: 'Happy Auth', username: 'Happyauth', email: 'happy@auth.com', password: '12345')
#     visit('/')
#     click_button 'Sign in'

#     fill_in :email, with: 'happy@auth.com'
#     fill_in :password, with: '12345'

#     click_button('Sign in')

#     expect(page).to have_content 'You are successfully logged in as Happyauth'

#   end
# end
