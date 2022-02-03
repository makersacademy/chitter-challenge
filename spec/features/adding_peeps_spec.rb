require 'pg'

feature 'Creating peeps' do
  scenario 'A user can create a peep' do
    User.create(username: 'Hagrid', email: 'hagrid@mail.com', password: 'hagrid123')

    visit('/')
    click_link('Log In')
    login
    visit('/peeps')
    click_button('New Peep!')
    visit('/peeps/new')
    fill_in('text', with: 'My first peep!')
    click_button('Submit')

    visit('/peeps')
    expect(page).to have_content('My first peep!')
    expect(page).to have_content('Hagrid')
  end
end
