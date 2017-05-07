# feature 'User can log in with email and password' do
#
#     let!(:user) do
#       User.create(email: 'ana@great.com',
#                   password: 'apples',
#                   name: 'Ana Maria Suciu',
#                   username: 'ana')
#     end
#     scenario 'existing user logs in with correct info' do
#     visit '/'
#     fill_in 'email', with: 'ana@great.com'
#     fill_in 'password', with: 'apples'
#     click_button 'Log In'
#
#     expect(current_path).to eq '/home'
#     expect(page).to have_content 'Howdy, @ana! Peep now or forever hold your piss (Oh, noooo!)'
#   end
# end
