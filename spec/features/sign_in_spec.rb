feature "Sign-In" do

  scenario 'existing user signs in successfully on sign in page' do
    email = "rick@astely.com"
    create_user(email: email)
    sign_in(email: email)
    expect(page).to have_content(email)
  end

  scenario "non-existing user can't sign in" do
    email = "rick@astely.com"
    sign_in(email: email)
    expect(page).not_to have_content(email)
    expect(page).to have_content("The email or password is incorrect")
  end



end
