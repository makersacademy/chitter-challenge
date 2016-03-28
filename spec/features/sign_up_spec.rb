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

  context "invalid sign up: username" do
    scenario "user cannot sign up with an already registered username" do
      sign_up
      expect { sign_up(email: "darth@vader.com") }.not_to change { User.count }
      expect(page).to have_content "Username is already taken"
    end
  end

  context "invalid sign up: email" do
    scenario "user cannot sign up without entering an email" do
      expect { sign_up(email: nil) }.not_to change { User. count }
      expect(page).to have_content "Email must not be blank"
    end

    scenario "user cannot sign up with invalid email format" do
      expect { sign_up(email: "invalid@email") }.not_to change { User.count }
      expect(page).to have_content "Email has an invalid format"
    end

    scenario "user cannot sign up with an already registered email" do
      sign_up
      expect { sign_up(username: "other_luke") }.not_to change { User.count }
      expect(page).to have_content "Email is already taken"
    end
  end
end
