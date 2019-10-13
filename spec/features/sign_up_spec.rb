feature 'Sign Up' do

  # Details of a fictitious existing account
  let(:email) { 'test@example.com' }
  let(:password) { 'pass123' }
  let(:name) { 'Melvin Lau' }
  let(:username) { 'melvinlau' }

  scenario 'A new user can sign up for an account' do
    visit '/'
    within('div.sign-up') do
      fill_in 'email', with: 'another@example.com'
      fill_in 'password', with: 'pass123'
      fill_in 'name', with: 'Melvin Lau'
      fill_in 'username', with: 'melvinlau2'
      click_button 'Sign Up'
    end
    expect(page).to have_content 'Melvin Lau'
  end

  scenario 'User cannot sign up with an email tied to an existing account' do
    User.create(
      email: email,
      password: password,
      name: name,
      username: username
    )
    visit '/'
    within('div.sign-up') do
      fill_in 'email', with: email
      fill_in 'password', with: 'pass123'
      fill_in 'name', with: 'Melvin Lau'
      fill_in 'username', with: 'melvinlau2'
      click_button 'Sign Up'
    end
    msg = 'An account already exists with this email address. Please use another.'
    expect(page).to have_content msg
  end

  scenario 'User cannot sign up with a username tied to an existing account' do
    User.create(
      email: email,
      password: password,
      name: name,
      username: username
    )
    visit '/'
    within('div.sign-up') do
      fill_in 'email', with: 'another@example.com'
      fill_in 'password', with: 'pass123'
      fill_in 'name', with: 'Melvin Lau'
      fill_in 'username', with: username
      click_button 'Sign Up'
    end
    msg = 'An account already exists with this username. Please choose another.'
    expect(page).to have_content msg
  end

end
