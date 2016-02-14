feature 'sign up for Chitter' do
  scenario 'users can choose to sign up' do
    visit '/'
    click_link 'Sign up'
    expect(current_path).to eq '/users/new'
  end

  scenario 'correctly signs up' do
    expect{ sign_up }.to change { User.count }.by 1
    expect(page).to have_content 'Welcome New User'
    expect(User.first.email).to eq 'user@email.com'
  end

  scenario 'confirmed password does not match' do
    expect{ sign_up(password_confirm: 'wrongpassword')}.not_to change{ User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Passwords did not match'
    expect(page).to have_selector("input[value='user@email.com']")
  end

  scenario 'invalid email address given' do
    expect{ sign_up(email: nil) }.not_to change{ User.count }
    expect{ sign_up(email: 'user@email') }.not_to change{ User.count }
    expect(page).to have_content 'Please enter a valid email address'
  end

  scenario 'email address has already been registered' do
    sign_up
    expect{ sign_up(username: 'different') }.not_to change{ User.count }
    expect(page).to have_content 'That email address is already registered'
  end

  scenario 'username has already been taken' do
    sign_up
    expect{ sign_up(email: 'diff@email.com') }.not_to change{ User.count }
    expect(page).to have_content 'Username is already taken'
  end

end
