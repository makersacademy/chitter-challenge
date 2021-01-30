require 'peep'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "Salut!"
    expect(page).to have_content "Ca farte?"
  end
end