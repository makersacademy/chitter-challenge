# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "Signing up" do
  scenario "I want to sign up for Chitter" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome to Chitter DangerMouse"
    expect(User.first.email).to eq("mouse@dmhideout.com")
  end

  scenario "I need to confirm my password to sign up" do
    expect { sign_up(password_confirmation: "goodgrief") }.not_to change(User, :count)
    expect(current_path).to eq("/users")
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "I can't sign up without a username" do
    expect { sign_up(username: "") }.not_to change(User, :count)
    expect(current_path).to eq("/users")
    expect(page).to have_content "Username must not be blank"
  end

  scenario "I can't sign up without valid email address" do
    expect { sign_up(email: "silas@greenback") }.not_to change(User, :count)
    expect(current_path).to eq("/users")
    expect(page).to have_content "Email has an invalid format"
  end
end
