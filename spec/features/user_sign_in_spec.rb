feature "user sign in" do

  scenario "user can sign in" do
    user_sign_up
    user_sign_in
    expect(page).to have_content "Welcome Ellie W"
  end

  scenario "user can sign in" do
    user_sign_up
    click_on "Sign out"
    user_sign_in_wrong_password
    expect(page).to have_content "Your email or password is incorrect"
  end
end
