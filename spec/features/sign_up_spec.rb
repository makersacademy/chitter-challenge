feature "User sign Up" do

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  scenario "new user signs up" do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome cat@catmail.com!"
    expect(User.first.email).to eq("cat@catmail.com")
  end

  scenario "requires a matching confirmation password" do
    expect { sign_up(password_confirmation: "wrong") }.not_to change(User, :count)
  end

  def sign_up(email: "cat@catmail.com",
              password: "123",
              password_confirmation: "124")
  visit "/users/new"
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign up"
  end
end