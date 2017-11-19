feature "signing-up" do
  scenario "/sign_up prompts a user to enter name" do
    click_sign_up
    expect(page).to have_content "Name"
  end
  scenario "/sign_up prompts a user to enter username" do
    click_sign_up
    expect(page).to have_content "Username"
  end
  scenario "/sign_up prompts a user to enter email address" do
    click_sign_up
    expect(page).to have_content "Email"
  end
  scenario "/sign_up prompts a user to enter password" do
    click_sign_up
    expect(page).to have_content "Password"
  end
  scenario "/sign_up allows to submit a form" do
    click_sign_up
    expect(page).to have_button "Sign-up"
  end
  scenario "has a password confirmation" do
    click_sign_up
    expect(page).to have_content "confirmation"
  end
  scenario "does not create user if password confirmation != password" do
    click_sign_up
    fill_in("name", with: "Antonio")
    fill_in("username", with: "abc")
    fill_in("email", with: "antonio@makers.com")
    fill_in("password", with: "password")
    fill_in("password_confirmation", with: "other password")
    click_button "Sign-up"
    expect(User.all.count).to eq(0)
  end
  # scenario "doesn't let two users with the same email address sign-up" do
  #   sign_up
  #   click_sign_up
  #   fill_in("name", with: "Antonio")
  #   fill_in("username", with: "abc2")
  #   fill_in("email", with: "antonio@makers.com")
  #   fill_in("password", with: "password")
  #   fill_in("password_confirmation", with: "password")
  #   click_button "Sign-up"
  #   expect(User.all.count).to eq(1)
  # end
  # scenario "doesn't let two users with the same email address sign-up" do
  #   sign_up
  #   click_sign_up
  #   fill_in("name", with: "Antonio")
  #   fill_in("username", with: "abc")
  #   fill_in("email", with: "marie@makers.com")
  #   fill_in("password", with: "password")
  #   fill_in("password_confirmation", with: "password")
  #   click_button "Sign-up"
  #   expect(User.all.count).to eq(1)
  # end
end
