feature 'authentication' do
  scenario 'a user can log in' do
    sign_in
    click_button('Log out')
    click_button('Log in')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')
    expect(page).to have_content "Welcome to Chitter, Test"
  end

  scenario 'a user sees an error if they get their email wrong' do
    sign_in
    click_button('Log out')
    click_button('Log in')
    fill_in('email', with: 'testito@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')

    expect(page).not_to have_content "Welcome to Chitter, Test"
    expect(page).to have_content "Your email or your password is incorrect."
  end

  scenario 'a user sees an error if they get their email wrong' do
    sign_in
    click_button('Log out')
    click_button('Log in')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'vivaelbetis')
    click_button('Log in')

    expect(page).not_to have_content "Welcome to Chitter, Test"
    expect(page).to have_content "Your email or your password is incorrect."
  end

  scenario 'a user can sign out' do
    sign_in
    click_button('Log out')
    expect(page).not_to have_content 'Welcome, Test'
    expect(page).to have_content 'You have signed out.'
  end
end
