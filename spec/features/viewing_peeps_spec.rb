require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    Peep.create(peep: 'Salut!')
    Peep.create(peep: 'Ca farte?!')

    visit('/peeps')

    expect(page).to have_content "Salut!"
    expect(page).to have_content "Ca farte?"
  end
end