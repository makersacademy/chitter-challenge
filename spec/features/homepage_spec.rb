feature 'homepage' do
  scenario 'visiting the index page has sign up and log in buttons' do
    visit('/')
    expect(page).to have_content('Chitter')
    expect(page).to have_button('Sign Up')
    expect(page).to have_button('Log In')
  end
end