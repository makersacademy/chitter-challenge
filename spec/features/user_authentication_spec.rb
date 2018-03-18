feature 'User authentication' do
  scenario 'a user can sign in' do
    User.create(email: 'test@example.com', user_name: 'Tom123', name: "Tom Betts", password: 'password123')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Hello Tom123, Welcome to Chitter!'
  end

  scenario 'a user can sign out' do
    User.create(email: 'test@example.com', user_name: 'Tom123', name: "Tom Betts", password: 'password123')
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end
end
