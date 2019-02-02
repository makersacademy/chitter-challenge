require './app'

feature 'posting a message' do
  scenario 'user can post a message to chitter' do
    visit('/')
    fill_in 'message', with: "I love Sinatra"
    click_button 'Submit'
    expect(page).to have_content("I love Sinatra")

  end
end
