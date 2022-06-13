require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    Peeps.create(peeps: 'The weather is brilliant today')
    Peeps.create(peeps: 'The football game is on!')
    Peeps.create(peeps: 'My wedding is on Monday')

    visit '/peeps'

    expect(page).to eq "A user can see peeps"
    expect(page).to eq('The football game is on!')
    expect(page).to hav./e_link('My wedding is on Monday')
  end
end
