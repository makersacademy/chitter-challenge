require 'pg'

feature 'Viewing Chitter' do
  scenario 'visiting the chitter page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end