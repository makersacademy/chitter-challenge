feature 'Logging in to Chitter' do
  user = User.new(name: 'Katie', username: 'Smithy', email: 'K@email.com', password: 'secret', password_confirmation: 'secret')

  scenario 'An already registered user can log in' do
    sign_up(user)
    click_button 'Submit'
    visit '/'
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_button 'Submit'
    expect(page).to have_content "Welcome back #{user.username}!"
  end

  scenario 'An unregisted user cannot log in' do
    visit '/'
    fill_in :username, with: 'Hannah'
    fill_in :password, with: 'hiya'
    click_button 'Submit'
    expect(page).not_to have_content "Welcome back Hannah!"
    expect(page).to have_content "You need to sign up first"
  end

  scenario 'A registered user cannot log in with the wrong password' do
    sign_up(user)
    click_button 'Submit'
    visit '/'
    fill_in :username, with: user.username
    fill_in :password, with: 'wrong'
    click_button 'Submit'
    expect(page).to have_content 'Looks like you forgot your password'
  end
end
