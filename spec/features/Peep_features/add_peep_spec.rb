require 'pg'

feature 'Adding a new peep' do
  scenario 'a user can add a peep onto chitter' do
    PG.connect(dbname: 'chitter_test')
    login
    fill_in 'post', with: 'Breaking peep!!'
    click_button 'Peep'

    expect(page).to have_content('Breaking peep!!')
  end
end