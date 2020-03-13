require 'pg'

feature 'Visiting the homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Peep Manager"
  end
end

feature 'Viewing peeps' do
  scenario ' a user can see peeps' do

    Peep.create(peeps: "First Peep")
    Peep.create(peeps: "Second Peep")
    Peep.create(peeps: "Third Peep")

    visit('/peeps')

    expect(page).to have_content "First Peep"
    expect(page).to have_content "Second Peep"
    expect(page).to have_content "Third Peep"
  end
end