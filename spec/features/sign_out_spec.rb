feature "Sign out" do

  scenario "User can sign out after signing in" do
    User.create('George', 'test@example.com', 'password123')

    visit('/')
    click_button('Sign in')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    click_button('Sign out')
    expect(page).not_to have_content('Welcome George')
    expect(page).to have_content('You have succesfully signed out')
  end

  scenario "No sign out button when they haven't signed in" do
    visit('/')
    expect(page).not_to have_content('Sign out')
  end

end
