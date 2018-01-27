feature 'Sign up' do

  scenario 'The user can sign up as a new user' do
    visit '/user/new'
    expect(page.status_code).to eq(200)
    sign_up
    expect(User.count).to eq(1)
  end

  scenario 'The user\'s username is displayed on the screen' do
    visit '/user/new'
    sign_up
    expect(page).to have_content("Hey EllieWem!")
  end

  scenario 'The form requires a matching password' do
    visit '/user/new'
    sign_up_wrong_password
    expect(User.count).to eq 0
  end

  scenario 'The page displays an error message if the password is wrong' do
    visit '/user/new'
    sign_up_wrong_password
    expect(page).to have_content("The passwords do not match")
  end

  scenario 'The user cannot sign up without an email address' do
    visit '/user/new'
    fill_in 'username', with: 'EllieWem'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'wrongpassword'
    click_button 'Sign up'
    expect(User.count).to eq 0
  end

  scenario 'The user cannot sign up without a username' do
    visit '/user/new'
    fill_in 'email', with: 'testing@test.co.uk'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'wrongpassword'
    click_button 'Sign up'
    expect(User.count).to eq 0
  end

end
