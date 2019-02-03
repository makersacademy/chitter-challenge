require 'user'

feature 'Registration-unit tests' do
  scenario 'User can view the registration page' do
    visit('/register')
    expect(page).to have_no_content("ditty")
  end
  scenario 'User can see the four required fields' do
    visit('/register')
    expect(page).to have_field("name")
    expect(page).to have_field("username")
    expect(page).to have_field("email")
    expect(page).to have_field("password")
  end

  scenario '#register method responds' do
    expect(User).to respond_to(:register)
  end

  scenario 'Registering details redirects the user to a confirmation page' do
    visit('/register')
    fill_in :name, with: "Test User"
    fill_in :username, with: "TestUser"
    fill_in :email, with: "testuser@chitter.com"
    fill_in :password, with: "Password123"
    click_button "Register"
    expect(current_path).to eq('/confirm-registration')
  end
end
