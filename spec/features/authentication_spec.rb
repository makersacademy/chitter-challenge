feature 'authentication' do
  scenario 'a user can sign in' do
    create_account
    click_button('signout')
    click_on('Sign in')
    fill_in(:email, with: 'caesar@conures.com')
    fill_in(:password, with: 'parrots1')
    click_button('Go')
    expect(page).to have_content 'Welcome, Caesar'
  end
  scenario 'raises an error if the user gets their email wrong' do
    visit '/'
    click_on('Sign in')
    fill_in(:email, with: 'cafasfaesar@conures.com')
    fill_in(:password, with: 'pargrdgsdgrrots1')
    click_button('Go')
    expect(page).to have_content 'User not found'
  end
  scenario 'a user sees an error if they get their password wrong' do
    visit '/'
    click_on('Sign in')
    fill_in('email', :with => 'caesar@conures.com')
    fill_in('password', with: 'wrongpassword')
    click_button('go')
    expect(page).not_to have_content 'Welcome, Caesar'
    expect(page).to have_content 'User not found'
  end
  scenario 'Users are able to sign out' do
    login
    click_button('signout')
    expect(page).not_to have_content 'Welcome, Caesar'
    expect(page).to have_content 'Signed out'
  end
end
