require 'pg'

feature 'register users' do
  scenario 'a user can register' do
    connection = PG.connect(dbname: 'chitter_test')

    visit('/')
    click_link('Register')
    visit('/users/new')
    # fill_in('username', with: 'Hagrid')
    fill_in :username, with: 'Hagrid'
    fill_in :email, with: 'hagrid@gmail.com'
    fill_in :password, with: 'hagrid123'    
    click_button('Sign Up')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content('Welcome to Chitter Hagrid!')
  end
end