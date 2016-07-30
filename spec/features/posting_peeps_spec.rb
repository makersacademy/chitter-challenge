# feature 'Posting Peeps' do
#   scenario 'user can post a new peep' do
#     visit '/peeps/new'
#     fill_in 'message', with: 'This is my first peep'
#     click_button 'Post Peep'
#
#     expect(current_path).to eq '/peeps'
#     expect(page).to have_content 'This is my first peep'
#   end
# end
