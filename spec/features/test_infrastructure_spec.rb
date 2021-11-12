require 'pg'

feature 'test setup infrastructure' do
  scenario 'user will see a welcome when going to localhost:4567' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
