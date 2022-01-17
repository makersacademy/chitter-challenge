require './app'

feature 'index' do
  scenario 'chitter message form' do
    visit('/')
        
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
