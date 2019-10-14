require 'pg'

feature 'Viewing peeps' do
  scenario 'User can see peeps' do
    Peep.create(message: "My first peep")
    Peep.create(message: "My second peep")
    Peep.create(message: "My third peep")

    visit '/peeps'

    expect(page).to have_content('My first peep')
    expect(page).to have_content('My second peep')
    expect(page).to have_content('My third peep')
  end
end
