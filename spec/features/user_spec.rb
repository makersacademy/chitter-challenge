feature 'user' do
  scenario 'able to go to sign-in page' do
    visit('/')
    click_button 'Sign Up'

    expect(current_path).to eq '/user/sign-up'
  end

  scenario 'able to go to sign-up page' do
    visit('/')
    click_button 'Log In'

    expect(current_path).to eq '/user/log-in'
  end

  scenario 'as a user want to see log in credentials' do
    user_sign_up_to_chitter

    expect(current_path).to eq '/chitter'
    expect(page).to have_content 'User Name user-email@email.com'
  end

  scenario 'able to log user out' do
    user_sign_up_to_chitter
    click_button 'Log Out'

    expect(current_path).to eq '/chitter'
    expect(page).not_to have_content 'User Name user-email@email.com'
  end

  scenario 'able to log in user' do
    user_log_in_to_chitter

    expect(current_path).to eq '/chitter'
    expect(page).to have_content 'User Name user-email@email.com'
  end

  scenario 'log out message if user logs out' do
    user_log_in_to_chitter
    click_button 'Log Out'
    
    expect(page).to have_content 'You successfully logged out'
  end

end