require 'pg'

feature 'Viewing Chitter' do
  scenario 'A user can see the Chitter index page' do
    visit('/peeps')
    expect(page).to have_content "Chitter"
  end
end