require 'pg'

feature 'allows any user to add a peep' do
  scenario 'a user adds a peep to the db' do
    visit('/new')
    Peep.add(peep: "me again", title: "katie")

    expect(page).to have_content 'me again'
    expect(page).to have_content 'katie'
  end
end
