# feature 'posting messages (peeps)' do
#
#   scenario 'a user can post a new peep' do
#     log_in
#     fill_in 'peep', with: "I love chitter!"
#     click_button 'peep-peep!'
#     expect(current_path).to eq '/peeps'
#     expect(page).to have_content("I love chitter!")
#   end
#
# end
