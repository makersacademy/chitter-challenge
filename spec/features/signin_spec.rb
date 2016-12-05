# feature 'User sign in' do
#   let!(:user) do
#     User.create(email: 'verito@test.com', password: 'password')
#   end
#
#   scenario 'with credentials' do
#     signin(email: user.email, password: user.password)
#     expect(page).to have_content "Welcome, #{user.email}"
#   end
#
#   def signin(email:, password:)
#     visit '/signin'
#     fill_in :email, with: email
#     fill_in :password, with: password
#     click_button 'Sign in'
#   end
# end
