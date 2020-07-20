require 'pg'

feature 'View peeps' do
  scenario 'A user can see the peeps' do
    Peep.create(peep: 'A lovely day', time: 'now')
    Peep.create(peep: 'An interesting day', time: 'now')
    visit('/chitter')
    expect(page).to have_content "A lovely day"
    expect(page).to have_content "An interesting day"
  end
end
