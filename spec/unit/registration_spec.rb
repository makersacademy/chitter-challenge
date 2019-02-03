feature 'Registration-unit tests' do
  scenario 'User can view the registration page' do
    visit('/register')
    expect(page).to have_no_content("ditty")
  end
  scenario 'User can see the three required fields' do
    visit('/register')
    expect(page).to have_field("username")
    expect(page).to have_field("email")
    expect(page).to have_field("password")
  end
end
