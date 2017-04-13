# feature 'Viewing peeps' do
#   scenario "I can input a peep and see it on the homepage" do
#     Peep.create(message: 'My first peep!')
#     visit '/'
#     expect(page.status_code).to eq 200
#     within 'ul#peeps' do
#       expect(page).to have_content('My first peep!')
#     end
#   end
#
#   scenario 'post new peeps' do
#     visit '/peeps/new'
#     fill_in 'message', with: 'My first peep!'
#     click_button 'Post'
#     expect(current_path).to eq '/'
#     within 'ul#peeps' do
#     expect(page).to have_content('My first peep!')
#     end
#   end
# end
