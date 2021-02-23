feature "registration" do 

  scenario "create a new user" do
    go_to_index_page_and_register_a_new_user
    new_user = User.last
    expect(new_user.username).to eq "tester"
  end

  scenario "starting a new session" do
    go_to_index_page_and_register_a_new_user

    expect(current_path).to eq "/"
    click_button "Sign in"
    expect(current_path).to eq "/sessions/new"

    fill_in "email", with: "test@test.com"
    fill_in "password", with: "password123"
    click_button "Sign in"

    expect(current_path).to eq "/"
    expect(page).to have_content "Welcome, tester"
  end

  scenario "logging in with the wrong password" do
    go_to_index_page_and_register_a_new_user

    expect(current_path).to eq "/"
    click_button "Sign in"
    expect(current_path).to eq "/sessions/new"

    fill_in "email", with: "test@test.com"
    fill_in "password", with: "wrongpassword"
    click_button "Sign in"

    expect(page).to have_content "no good!"
  end

end
