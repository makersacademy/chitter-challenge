# require 'pry'
# feature 'delete peep' do
#   scenario 'user wants to delete a peep' do
#     sign_up_user
#     click_button("home")
#     click_button('peep')
#     fill_in('post', with: 'A peep to forget!')
#     click_button('Submit')
#     click_button 'Delete'
#     expect(current_path).to eq '/'
#     expect(page).not_to have_content('A peep to forget!')
#   end
# end
