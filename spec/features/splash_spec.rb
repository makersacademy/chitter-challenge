feature 'Home page' do
  scenario 'greets user and offers Register and Log In options' do
    visit('/')
    expect(page).to have_content('Welcome, Stranger ... this is Chitter.')
    expect(page).to have_button('Register')
    expect(page).to have_content('Already registered?')
    expect(page).to have_button('Log in')
  end
end
