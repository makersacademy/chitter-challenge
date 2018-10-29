feature 'authentication' do
  scenario 'a user can sign in' do
    User.create(email: 'test@example.com', name: 'Mr Test', username: 'test_test', password: 'password123')

    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, test@example.com'
  end
end

feature 'authentication' do
  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', name: 'Mr Test', username: 'test_test', password: 'password123')

    visit '/sessions/new'
    fill_in('email', with: 'nottherightemail@me.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end
end

feature 'authentication' do
  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', name: 'Mr Test', username: 'test_test', password: 'password123')

    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Please check your email or password.'
  end
end

feature 'authentication' do
  scenario 'a user can sign out' do
    User.create(email: 'test@example.com', name: 'Mr Test', username: 'test_test', password: 'password123')

    visit '/sessions/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end
end
