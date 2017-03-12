# feature 'User login' do
#   let!(:user) do
#     User.create(user_name:'JohnS', password:'cherry5')
#   end
#   scenario 'with the correct user_name and password' do
#     login(user_name: user.user_name, password: user.password_encripted)
#     expect(page).to have_content("Welcome #{user.user_name}")
#   end
#   def login(user_name:, password:)
#     visit '/login'
#     fill_in :user_name, with: user_name
#     fill_in :password, with: password
#     click_button('login')
#   end
# end
