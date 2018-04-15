feature 'On visiting the log in page for chitter' do
  scenario 'The user has options to enter username and password and submit them through a button, also a button to sign up' do
    visit ('/chitter')
    expect(page).to have_field 'username'
    expect(page).to have_field 'password'
    expect(page).to have_button 'Log in'
    expect(page).to have_button 'Sign up'

  end

  scenario 'The user is prompted to sign up if they do not have an account' do

    visit('/chitter')
    fill_in('username', with: 'user_does_not_exist')
    fill_in('password', with: 'pass_does_not_exist')
    click_button('Log in')
    expect(page).to have_content 'Log in details not found, please click sign up'

  end
end
