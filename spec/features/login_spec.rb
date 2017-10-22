# feature 'Login' do
#   before do
#     User.create(email: 'alice@example.com', password: 'hello123', password_confirmation: 'hello123')
#     log_in
#   end
#   scenario 'I want to be welcomed on logging in' do
#     expect(page).to have_content 'Welcome, alice@example.com!'
#   end
#
#   # scenario 'I want current_user to return the user who logged in' do
#   #   expect(current_user.email).to eq 'example@example.com'
#   # end
# end
