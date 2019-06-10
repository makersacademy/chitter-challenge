# feature 'user can post message on Chitter' do
#   scenario 'user can see the form to submit a peep when they open /chitter' do
#     visit '/chitter' 
#     expect(page).to have_field("Peep")
#     expect(page).to have_button("Post Peep")
#   end

#   scenario 'user can submit a peep to chitter' do
#     visit '/chitter'
#     fill_in 'Peep', with: 'It is finally Friyay!'
#     click_on 'Post Peep' 
#     expect(page).to have_content('It is finally Friyay!') 
#   end

#   scenario 'the user can see the peep they posted when they visit the feed page' do
#     visit '/chitter/feed'
#     expect(page).to have_content('It is finally Friyay!')
#   end
# end