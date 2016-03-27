feature 'User management -sign up:' do

  scenario 'User is asked to signup/login when visiting /home w/o loging in' do
    visit'/home'
    click_button('Sign up')
    expect(current_path).to eq('/users/new')
    visit'/home'
    click_button('Log in')
    expect(current_path).to eq('/sessions/new')
  end

  scenario 'User can sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter, jinis!')
    expect(User.first.username).to eq('jinis')
  end

  scenario 'User needs to confirm password before signing up' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'User can\'t sign up without a username' do
    expect{ sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'User can\'t sign up if username is alreay taken' do
    sign_up
    log_out
    expect{ sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username is already taken')
  end

  scenario 'User can\'t sign up without an email address' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'User can\'t sign up if email is already taken' do
    sign_up
    log_out
    expect{ sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email is already taken')
  end

  scenario 'User can\'t sign up with invalid email address' do
    expect{ sign_up(email: 'invalid_email') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end
end
