require 'pg'

feature 'index page' do
  scenario 'Shows the homepage' do
    visit '/'
    expect(page).to have_content("It's Chitter Chatter Time!")
  end
end
