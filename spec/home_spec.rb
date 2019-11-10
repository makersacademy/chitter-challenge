feature 'Home page' do
  scenario 'greets user and offers Sign Up and Log In options' do
    visit('/')
    expect(page).to have_content('Howdy, Stranger!')
    expect(page).to have_button('Register')
    expect(page).to have_content('Already registered?')
    expect(page).to have_button('Log in')
  end
end
