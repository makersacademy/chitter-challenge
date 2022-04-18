feature "Log in" do
  it "allows the user to log in with their details after signing up" do
    signup
    fill_in 'email', with: "johndoe@gmail.co.uk"
    fill_in 'password', with: "Password123"
    click_button 'Log in'
    expect(page).to have_content "Hello JDoe123"
  end

  it "shows the user a failure page when they enter their login details incorrectly" do
    signup
    fill_in 'email', with: "johndoe@gil.co.uk"
    fill_in 'password', with: "Pasord123"
    click_button 'Log in'
    expect(page).not_to have_content "Hello JDoe123"
    expect(page).to have_content "Invalid details"
  end
end
