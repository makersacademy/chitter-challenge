feature 'load Chitter homepage' do
  scenario 'Homepage for Chitter should load on user screen' do
    visit '/'
    # fill_in 'url', with: 'Hello chitter'
    # click_button 'submit'
    # this should take us to the homepage with a welcome message
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
