feature "Log in" do
  it "allows the user to log in with their details after signing up" do
    visit '/signup'
    fill_in 'name', with: "John Doe"
    fill_in 'username', with: "JDoe123"
    fill_in 'email', with: 'johndoe@gmail.co.uk'
    fill_in 'password', with: "Password123"
    click_button 'Create account'
    fill_in 'email', with: "johndoe@gmail.co.uk"
    fill_in 'password', with: "Password123"
    click_button 'Log in'
    expect(page).to have_content 'Hello JDoe123'
  end
end
