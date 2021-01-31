feature "registration" do 

  scenario "create a new user" do
    visit "/"

    click_button "Join Chitter"
    expect(current_path).to eq "/new_user"

    fill_in "email", with: "test@test.com"
    fill_in "real_name", with: "R Name"
    fill_in "username", with: "tester"
    fill_in "password", with: "password123"
    click_button "Register"

    new_user = User.last
    expect(new_user.username).to eq "tester"

    # expect(current_path).to eq "/"
    # expect(page).to have_content "tester"
    # expect(page).to have_content "R Name"
  end

end
