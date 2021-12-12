require 'pg'

feature 'Viewing peeps' do
  scenario 'a user can view all peeps' do # needs to be in reverse chronological order
    Peep.create(peep_body: 'Example peep posted at 3pm')
    Peep.create(peep_body: 'Example peep posted at 2pm')
    Peep.create(peep_body: 'Example peep posted at 1pm')

    visit '/home'

    expect(page).to have_content "Example peep posted at 3pm"
    expect(page).to have_content "Example peep posted at 2pm"
    expect(page).to have_content "Example peep posted at 1pm"
  end 
end
