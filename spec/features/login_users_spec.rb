require 'pg'

feature 'logging in a user' do
  scenario 'a registered user can log in' do
    connection = PG.connect(dbname: 'chitter_test')
    User.create(username: 'Hagrid', email: 'hagrid@mail.com', password: 'hagrid123')

    visit('/')
    click_button('Log In')
    visit('/users/login')
    fill_in :username, with: 'Hagrid'
    fill_in :password, with: 'hagrid123'
    click_button('Log In')
    visit('/peeps')
    expect(page).to have_content('Welcome to Chitter Hagrid!')
  end
end 