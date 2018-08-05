feature 'Lets a user enter his name' do
  scenario 'Returns a page greeting the user' do
    visit('/')
    fill_in :username, with: 'Daniel'
    click_button 'Start Chitter!'
    expect(page).to have_content 'Welcome, Daniel. Speak to the world below!'
  end
end
