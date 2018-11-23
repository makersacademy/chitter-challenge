feature 'sign up' do
  scenario 'signup form up for new user' do
    visit('/')
    click_link('login_signup')
    expect(page).to have_field("fname")
    expect(page).to have_field("lname")
    expect(page).to have_field("email")
    expect(page).to have_field("confirm_email")
    expect(page).to have_field("pwd")
    expect(page).to have_field("confirm_pwd")
  end
end
