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
end
