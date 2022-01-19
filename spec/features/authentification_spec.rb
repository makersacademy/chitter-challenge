feature 'authentificating users details' do
  scenario 'user logs in' do
    User.create(name: 'Pingu Penguin', username: 'Pingu', email: 'pingu@penguin.co.uk', password: 'meepmoop')

    visit('/sessions/new')
    fill_in 'email', with: 'pingu@penguin.co.uk'
    fill_in 'password', with: 'meepmoop'
    click_on 'Log in'

    expect(page).to have_content 'Pingu'
  end

  scenario 'user sees an error if they get something wrong' do
    User.create(name: 'Pingu Penguin', username: 'Pingu', email: 'pingu@penguin.co.uk', password: 'meepmoop')

    visit('/sessions/new')
    fill_in 'email', with: 'oops@penguin.co.uk'
    fill_in 'password', with: 'meepmoop'
    click_on 'Log in'

    expect(page).not_to have_content 'Pingu'
    expect(page).to have_content 'Please check your e-mail and password'
  end

end