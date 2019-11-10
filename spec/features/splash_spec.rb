feature 'Home page' do
  scenario 'greets user and offers Register and Log In options' do
    visit('/')
    expect(page).to have_content('Welcome, Stranger ... this is Chitter.')
    expect(page).to have_button('Register')
    expect(page).to have_content('Already registered?')
    expect(page).to have_button('Log in')
  end

  scenario 'allows user to proceed to registration screen' do
    visit('/')
    click_button('Register')
    expect(page).to have_content("Please enter your details.")
    expect(page).to have_field("name")
    expect(page).to have_field("password")
  end

  scenario 'allows user to proceed to log in screen' do
    visit('/')
    click_button('Log in')
    expect(page).to have_content("Please log in below.")
    expect(page).to have_field("name")
    expect(page).to have_field("password")
  end
end
