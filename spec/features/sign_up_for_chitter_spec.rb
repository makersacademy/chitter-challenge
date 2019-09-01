feature 'sign up for chitter' do
  scenario 'a user can sign up for chitter' do
    visit '/'
    click_button 'Sign up'
    fill_in(:email, with: 'me@example.com')
    fill_in(:password, with: 'password1234')
    click_button 'Sign up'

    expect(page).to have_current_path('/')
    expect(page).to have_content('me@example.com is now signed up')
    expect(page).to_not have_content('Not a member?')
  end
  scenario 'a user cannot sign up if already registered' do
    visit '/'
    click_button 'Sign up'
    fill_in(:email, with: 'admin@chitter.com')
    fill_in(:password, with: 'password1234')
    click_button 'Sign up'

    expect(page).to have_content('admin@chitter.com is already signed up')
  end
  scenario 'a user cannot sign up with an invalid email' do
    visit '/'
    click_button 'Sign up'
    fill_in(:email, with: 'admin.chitter.com')
    fill_in(:password, with: 'password1234')
    click_button 'Sign up'

    expect(page).to have_content('admin.chitter.com is not a valid email')
  end
  scenario 'password must be 6 characters or longer', js: true do
    visit '/'
    click_button 'Sign up'
    fill_in(:email, with: 'newuser@chitter.com')
    fill_in(:password, with: '1234')
    click_button 'Sign up'

    expect(page).to have_content('Password must be at least 6 characters')
  end
end
