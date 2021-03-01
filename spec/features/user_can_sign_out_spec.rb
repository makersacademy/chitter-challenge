feature 'authentication' do
  scenario 'a user can sign out' do
    # Create the user
    User.create(email: 'test@example.com', password: 'password123')

    # Sign in as that user
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('sign_in')

    # Sign out
    click_button('sign_out')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'You have signed out.'
  end
end
