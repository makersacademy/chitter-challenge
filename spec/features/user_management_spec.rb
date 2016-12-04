feature "User sign up" do

  scenario "I can sign up as a new user" do
    visit "/users/new"
    expect{ sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq("kenji@gmail.com")
    expect(page).to have_content("Welcome, kenji@gmail.com")
  end

  scenario "with a password that does not match" do
    expect { sign_up(password_confirmation: "wrong") }.not_to change(User, :count)
    expect(current_path).to eq("/users")
    expect(page).to have_content "Password and confirmation password do not match"
  end

  scenario "I can't sign up wtihout an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end
end
