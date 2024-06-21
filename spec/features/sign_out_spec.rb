feature 'Sign out' do
  scenario 'a user can sign out' do
    User.create(email: 'test1@test.com', password: 'password123', name: 'test1', username: 'test1')

    visit '/sessions/new'
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    click_button('Sign out')

    expect(page).not_to have_content 'Welcome, test1!'
    expect(page).to have_content 'You have signed out.'
  end
end