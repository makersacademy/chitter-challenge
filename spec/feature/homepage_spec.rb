feature 'Homepage' do
  scenario 'User can go to home page and see a welcome message' do
    visit("/")
    expect(page).to have_content("Chitter")
  end

  # scenario 'I can post up a message to the main board with my user name' do
  #   visit("/")
  #   fill_in 'message', with: 'blahblahblah'
  #   fill_in 'username', with: 'Mary3000'
  #   find_button('Post Message').click
  #   expect(page).to have_content('blahblahblah')
  # end
end
