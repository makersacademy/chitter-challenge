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
    visit('/user/sign-up')
    fill_in 'user_name', with: 'User Name'
    fill_in 'user_email', with: 'user-email@email.com'
    fill_in 'user_password', with: 'password'
    click_button 'Sign Up'

    expect(current_path).to eq '/chitter'
    expect(page).to have_content 'User Name user-email@email.com'
  end

end