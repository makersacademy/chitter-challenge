require 'pg'

feature 'Viewing Chitter' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'Viewing chitter feed' do
  scenario 'User can see all peeps in feed' do
    visit('/feed')

    expect(page).to have_content "First Peep!"
    expect(page).to have_content "Second Peep!"
    expect(page).to have_content "Third Peep!"
  end
end
