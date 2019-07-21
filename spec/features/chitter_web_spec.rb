feature 'Testing Index Page' do
  scenario 'index page returns messages' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter!'

  end
end

# feature 'Adding a new message' do
#   scenario 'A user can add a message to Chitter Challenge' do
#     visit('/message/index')
#     click_on('Create Peep')
#     fill_in 'nickname', with: 'Bob'
#     fill_in "message", with: 'Tests are the best'
#     click_button('Submit')
#     expect(page).to have_text 'Tests are the best'
#   end
# end
