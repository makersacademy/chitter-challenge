feature 'loging in' do
  scenario 'a user signs in with the correct credentials' do
    visit '/login'
    fill_in(:email, with: "test@gmail.com")
    fill_in(:password, with: "password123")
    click_button("Log In")
    expect(page).to have_content("Welcome Robert")
  end
end