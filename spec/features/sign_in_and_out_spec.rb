feature 'Signing in to Chitter' do
  before do
    User.create(
      username: 'amanzano',
      password: 'pass',
      password_confirmation: 'pass',
      email: 'arnold@myemail.com',
      name: 'Arnold Manzano')
  end

  scenario 'Signing in successfully' do
    sign_in
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Welcome amanzano')
  end

  scenario 'Invalid username or user does not exist' do
    sign_in(username: 'otheruser')
    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content('Invalid username/password')
  end

  scenario 'Invalid password' do
    sign_in(password: 'wrong_password')
    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content('Invalid username/password')
  end
end

feature 'Signing out from Chitter' do
  before do
    User.create(
      username: 'amanzano',
      password: 'pass',
      password_confirmation: 'pass',
      email: 'arnold@myemail.com',
      name: 'Arnold Manzano')
  end

  scenario 'Signing out successfully' do
    sign_in
    click_button('Sign out')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('You have successfully signed out')
  end
end
