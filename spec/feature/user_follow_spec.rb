# feature 'User follow' do
#
#   let!(:user_1) do
#     User.create(email: 'user_1@example.com',
#                 name: 'Test Person 1',
#                 password: 'secret1234',
#                 password_confirmation: 'secret1234')
#   end
#
#   let!(:user_2) do
#     User.create(email: 'user_2@example.com',
#                 name: 'Test Person 2',
#                 password: 'secret1234',
#                 password_confirmation: 'secret1234')
#   end
#
#   scenario 'follows another user' do
#     sign_in(email: user_1.email, password: user_1.password)
#     fill_in :follow, with: 'user_2@example.com'
#     click_button('Add')
#     expect(user_1.followers).to include(user_2)
#   end
# end
