feature "User signs up" do
  scenario "I am able to sign up for Chitter" do
    sign_up
    expect(page).to have_content("Welcome, John!")
    expect(User.first.username).to eq("John")
  end

  scenario "I am unable to sign up if passwords do not match" do
    visit("/users/new")
    expect(page.status_code).to eq(200)
    fill_in :name,                  with: "John Smith"
    fill_in :username,              with: "John"
    fill_in :email,                 with: "john@gmail.com"
    fill_in :password,              with: "12345"
    fill_in :password_confirmation, with: "54321"
    click_button("Sign up")
    expect(current_path).to eq("/users")
    message = "Invalid email, password and/or password confirmation"
    expect(page).to have_content(message)
  end

  scenario "I am unable to sign up if my email is not in the right format" do
    visit("/users/new")
    expect(page.status_code).to eq(200)
    fill_in :name,                  with: "John Smith"
    fill_in :username,              with: "John"
    fill_in :email,                 with: nil
    fill_in :password,              with: "12345"
    fill_in :password_confirmation, with: "54321"
    click_button("Sign up")
    expect(current_path).to eq("/users")
    message = "Invalid email, password and/or password confirmation"
    expect(page).to have_content(message)
  end
end
