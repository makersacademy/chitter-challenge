require 'pg'

feature 'Initializing app' do

  scenario 'visits landing page' do
    prime_database
    visit '/'
    expect(page).to have_content("Welcome to Chitter")
    expect(page).to have_content("Holy moly, what is this site meant to be??")
    expect(page).to have_content("Just got out of bed, what year is this?")
    expect(page).to have_content("Has anyone seen my motivation, I seem to have lost it.")
  end

end
