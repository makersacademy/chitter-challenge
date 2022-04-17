require 'pg'

feature 'view chitter welcome page' do
  scenario 'visit chitter welcome page' do
    visit '/'
    expect(page).to have_content("Welcome to Chitter!")
  end
end
