# feature 'a user registers' do
#     scenario 'a user can register' do
#         visit('/new')
#         fill_in :first_name, with:' Shirley'
#         fill_in :last_name, with: 'Mac'
#         fill_in :user_name, with: 'SMAC'
#         fill_in :email, with: 'test@example.com'
#         fill_in :password, with: 'password123'
#         click_button 'submit'
#         vist('/registered')
#         expect(page).to have_content "Welcome, Shirley"
#     end
#   end
