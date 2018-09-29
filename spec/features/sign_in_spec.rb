feature 'Sign up' do
  scenario 'when I log in, I want it to tell me I am logged in' do
    login_as_gimli
    expect(page).to have_content 'You are now signed in as GIMLITHEGREAT'
  end

  scenario 'It shouldnt let me log in if the username isnt registered' do
    visit '/'
    fill_in 'username', with: 'sauronthedeceiver'
    fill_in 'password', with: 'MY EYE!'
    click_button 'sign in'
    expect(page).to have_content 'incorrect username or password'
  end

  scenario 'It shouldnt let me log in if the password does not match the username' do
    add_some_users
    visit '/'
    fill_in 'username', with: 'GIMLITHEGREAT'
    fill_in 'password', with: 'not_erebor'
    click_button 'sign in'
    expect(page).to have_content 'incorrect username or password'
  end
end
