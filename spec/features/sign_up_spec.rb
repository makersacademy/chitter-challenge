feature "User sign Up" do

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  scenario "new user signs up" do
    visit "/users/new"
    expect(page.status_code).to eq 200
    fill_in :email, with: "cat@catmail.com"
    fill_in :password, with: "1234"
    expect { click_button "Sign up" }.to change(User, :count).by 1
    expect(page).to have_content "Welcome cat@catmail.com!"
    expect(User.first.email).to eq("cat@catmail.com")
  end

end