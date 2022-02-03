require 'pg'

feature 'Authentication' do
  scenario 'a registered user can log in' do
    User.create(username: 'Hagrid', email: 'hagrid@mail.com', password: 'hagrid123')
    login
    visit('/peeps')
    expect(page).to have_content('Welcome to Chitter Hagrid!')
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(username: 'Hagrid', email: 'hagrid@mail.com', password: 'hagrid123')

    visit('/sessions/new')
    fill_in('email', with: 'notright@mail.com')
    fill_in('password', with: 'hagrid123')
    click_button('Log In')

    expect(page).not_to have_content 'Welcome to Chitter Hagrid!'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(username: 'Hagrid', email: 'hagrid@mail.com', password: 'hagrid123')
    
    visit('/sessions/new')
    fill_in('email', with: 'hagrid@mail.com')
    fill_in('password', with: '123hagrid123')
    click_button('Log In')

    expect(page).not_to have_content 'Welcome to Chitter Hagrid!'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    User.create(username: 'Hagrid', email: 'hagrid@mail.com', password: 'hagrid123')

    login
    visit('/peeps')
    click_on('Log Out')
    expect(page).not_to have_content 'Welcome to Chitter Hagrid!'
    expect(page).to have_content 'You have signed out.'
  end

end
