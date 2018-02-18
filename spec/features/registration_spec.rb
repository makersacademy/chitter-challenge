feature "registration" do

  scenario "Users can register an account" do

    visit('/users/new')
    fill_in("email", with: "abc@123.com")
    fill_in("password", with: "abc123")
    fill_in("name", with: "Jim")
    fill_in("username", with: "Jimmy")
    click_button("Submit")

    expect(page).to have_content("Welcome Jimmy")

  end
end
