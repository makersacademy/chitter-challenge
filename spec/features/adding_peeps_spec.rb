require 'pg'

feature 'Creating peeps' do
  scenario 'A user can create a peep' do
    User.create(username: 'Hagrid', email: 'hagrid@gmail.com', password: 'hagrid123')

    visit('/')
    click_button('Log In')
    visit('/sessions/new')
    fill_in('email', with: 'hagrid@gmail.com')
    fill_in('password', with: 'hagrid123')
    click_button('Log In')
    click_link('New Peep!')
    visit('/peeps/new')
    fill_in('text', with: 'My first peep!')
    click_button('Submit')

    visit('/peeps')
    expect(page).to have_content('My first peep!')
    expect(page).to have_content('Hagrid')
  end
end
