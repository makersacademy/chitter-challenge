feature "User sign up" do
  scenario "user can sign up" do
    expect { sign_up }.to change { User.count }.by 1
    expect(page).to have_content "Welcome Luke"
    expect(User.last.username).to eq "skywalker"
    expect(User.last.email).to eq "luke@starwars.com"
  end

  context "invalid sign up: password" do
    scenario "no user created when passwords mismatch" do
      expect { sign_up(password_confirmation: "wrongpw") }.not_to change { User.count }
    end

    scenario "display message when passwords mismatch" do
      sign_up(password_confirmation: "wrongpw")
      expect(page.current_path).to eq "/users/new"
      expect(page).to have_content "Password does not match the confirmation"
    end
  end
end
