feature "sign in" do
  scenario "user can sign in to his account" do
    create_user
    visit"/signin"
    fill_in "user_name", with: "Ben09"
    fill_in "password", with: "1234"
    expect{ click_button "Sign in" }.not_to change(User, :count)
    expect(page).to have_content "Hello Ben"
    expect(current_path).to eq "/main"
  end
  scenario "user can't sign in to his account with invalid password" do
    create_user
    visit"/signin"
    fill_in "user_name", with: "Ben09"
    fill_in "password", with: "4321"
    click_button "Sign in"
    expect(page).to have_content "Invalid password or email!"
  end
end
