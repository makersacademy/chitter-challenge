feature 'sign up' do
  scenario 'signup form up for new user' do
    visit('/')
    click_link('login_signup')
    expect(page).to have_field("First name")
    expect(page).to have_field("Last name")
    expect(page).to have_field("Email address")
    expect(page).to have_field("Confirm email address")
    expect(page).to have_field("Password")
    expect(page).to have_field("Confirm password")
  end
end
