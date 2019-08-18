require 'capybara'

feature 'Testing infrastructure' do
  scenario 'Greeting page' do
    visit('/')
    expect(page).to have_content 'Chitter'
  end
end
