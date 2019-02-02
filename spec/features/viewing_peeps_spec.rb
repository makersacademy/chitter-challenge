require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see previous peeps in reverse chronological order' do
    Peeps.create(peep: 'First peep')
    Peeps.create(peep: 'Second peep')

    visit('/peeps')

    expect(page).to have_content "Second peep"
    expect(page).to have_content "First peep"
  end
end
