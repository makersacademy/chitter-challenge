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
    expect(page).to have_content("password does not match the confirmation")
  end

  scenario 'The user cannot sign up without an email address' do
    visit '/user/new'
    fill_in 'username', with: 'EllieWem'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'wrongpassword'
    click_button 'Sign up'
    expect(User.count).to eq 0
  end

  scenario 'The user cannot sign up without a valid email address' do
    visit '/user/new'
    fill_in 'email', with: 'notagreatemailaddress'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("email has an invalid format")
  end

  scenario 'Both error messages are displayed if email is in wrong format and passwords don\'t match' do
    visit '/user/new'
    fill_in 'email', with: 'oopsie'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'wrongpassword'
    click_button 'Sign up'
    expect(page).to have_content("password does not match the confirmation and email has an invalid format")
  end

  scenario 'The user cannot sign up if the email or username is already taken' do
    visit '/user/new'
    sign_up
    visit '/user/new'
    sign_up
    expect(page).to have_content('email is already taken and username is already taken')
  end
end
