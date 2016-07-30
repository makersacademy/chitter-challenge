###User Story 2
# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

# feature 'Logging into a chitter accounts' do
#     let(:user) do
#       User.create(first_name: 'first name',
#                   second_name: 'second name',
#                   username: 'username35',
#                   email: 'user@example.com',
#                   password: 'secret1234')
#     end
#
#   scenario 'I proceed to my home page if my passwords match' do
#     visit '/'
#     click_button 'ENTER CHITTER'
#     fill_in :email, with: 'user@example.com'
#     fill_in :password, with: 'secret1234'
#     click_button 'submit'
#     expect(page).to have_content "Hi first name"
#   end
#
#   scenario 'I am unable to log in if my passwords don\'t match' do
#     visit '/'
#     click_button 'ENTER CHITTER'
#     fill_in :email, with: 'user@example.com'
#     fill_in :password, with: 'secret1111'
#     click_button 'submit'
#     expect(page).to have_content "Incorrect password entered. Please retry."
#   end
# end
