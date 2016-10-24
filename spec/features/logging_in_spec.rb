feature 'Log in' do
  scenario 'A logged out user can see "log in" and "sign up" button on the homepage' do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'Log in')
    expect(page).to have_selector(:link_or_button, 'Sign up')
  end

  scenario 'A logged out user cannot post peeps' do
    visit '/'
    expect(page).not_to have_selector(:link_or_button, 'Publish peep')
  end

  scenario 'Fails with incorrect email and/or password' do
    create_account
    visit 'sessions/new'
    fill_in 'email', with: 'posie@shlack.com'
    fill_in 'password', with: 'notmypassword'
    click_button 'Log in'
    expect(page).to have_content 'The email or password is incorrect'
  end

end
