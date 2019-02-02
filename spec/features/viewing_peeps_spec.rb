require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see previous peeps' do
    Peeps.create(peep: 'First peep')
    Peeps.create(peep: 'Second peep')

    visit('/peeps')

    expect(page).to have_content "First peep"
    expect(page).to have_content "Second peep"
  end
end
