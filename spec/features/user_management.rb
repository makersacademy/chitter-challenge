# feature 'User signup requires a matching password' do
#
#   # scenario 'requires a matching password' do
#   #   expect { sign_in }.not_to change(User, :count)
#   # end
#
#   scenario 'with a password that does not match' do
#     visit '/signup'
#     fill_in 'email', with: 'john.smith@yournamedomain.co.uk'
#     fill_in 'password', with: '12345678'
#     fill_in 'password_confirmation', with: 'wrong'
#
#     expect { click_button 'Create account' }.not_to change(User, :count)
#     expect(current_path).to eq('/signup') # current_path is a helper provided by Capybara
#     expect(page).to have_content 'Password and confirmation password do not match'
#   end
#
# end
