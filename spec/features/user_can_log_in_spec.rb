feature 'User log-in:' do
  scenario 'existing user is able to log-in with correct details' do
    user = build(:user)
    sign_up(user)
    visit '/sessions/new'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Log in'
    expect(page).to have_content("#{user.username} is in the building.")
  end

  scenario 'existing user is unable to log-in with invalid email' do
    user = build(:user)
    sign_up(user)
    visit '/sessions/new'
    fill_in 'email', with: 'invalid'
    fill_in 'password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('The email and/or password you provided are incorrect')
    expect(page).to have_content('Please enter your account details below to log-in:')
  end

  scenario 'existing user is unable to log-in with invalid password' do
    user = build(:user)
    sign_up(user)
    visit '/sessions/new'
    fill_in 'email', with: user.email
    fill_in 'password', with: 'invalid'
    click_button 'Log in'
    expect(page).to have_content('The email and/or password you provided are incorrect')
    expect(page).to have_content('Please enter your account details below to log-in:')
  end

end
