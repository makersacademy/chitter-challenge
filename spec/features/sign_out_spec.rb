feature "sign-out" do
  scenario "sign-out when signed-in makes sign-in button show" do
    User.create(name: "name", username: "username", email: "email", password: "password", password_confirmation: "password")
    sign_in("email", "password")
    click_button "Sign-out"
    expect(page).to have_button("Sign-in")
  end
  scenario "sign-out when signed-in makes sign-in button show" do
    User.create(name: "name", username: "username", email: "email", password: "password", password_confirmation: "password")
    sign_in("email", "password")
    click_button "Sign-out"
    expect(page).not_to have_button("Sign-out")
  end
  scenario "sign-out when signed-in makes sign-in button show" do
    User.create(name: "name", username: "username", email: "email", password: "password", password_confirmation: "password")
    sign_in("email", "password")
    click_button "Sign-out"
    expect(page).to have_button("Sign-up")
  end
end
