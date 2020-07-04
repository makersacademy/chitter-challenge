feature 'Users can post messages' do
  scenario 'User can enter a message and see it disaplayed on the screen' do
    visit('/')
    fill_in :message, with: 'Hello Chitter!'
    click_button 'Submit'
    expect(page).to have_content('Hello Chitter!')
  end
end