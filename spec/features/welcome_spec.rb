feature 'Welcome' do
  scenario 'user gets the choice to logging in or signing up' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
    expect(page).to have_button('Sign up')
    expect(page).to have_button('Log in')

    click_button('Sign up')
  end
end
