feature "login" do
  scenario "a user can sign in" do
    visit('/')
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'password')
    click_button('Sign In!')
    expect(page).to have_content("test@test.com")
  end
end