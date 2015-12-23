# require './app/models/user' ---- put in as a trial - remove once test works

feature 'Logging in to Chitter' do
  user = User.new(name: 'Katie', username: 'Smithy', email: 'K@email.com', password: 'secret', password_confirmation: 'secret')

  scenario 'An already registered user can log in' do
    log_in(user.name, user.password)
    expect(page).to have_content "Welcome back #{user.username}!"
  end

  scenario 'An unregisted user cannot log in' do
    log_in('Hannah', 'hiya')
    expect(page).not_to have_content "Welcome back Hannah!"
    expect(page).to have_content "You need to sign up first"
  end

  scenario 'A registered user cannot log in with the wrong password' do
    log_in(user.username, 'wrong')
    expect(page).to have_content 'Looks like you forgot your password'
  end

  # scenario 'tests if authenticate method is working' do
  #   authenticated_user = User.authenticate(user.username, user.password)
  #   expect(authenticated_user).to eq user
  # end
end
