require "spec_helper"

feature "user signing up" do
  context "can sign up" do
    scenario "if all ok" do
      monkey = build :user
      expect { sign_up(monkey) }.to change(User, :count).by 1
      expect(page).to have_content "What's peeping #{monkey.name}?"
      expect(User.first.email).to eq monkey.email
      expect(User.first.username).to eq monkey.username
    end
  end
  context "cannot sign up" do
    scenario "if confirmation password different" do
      monkey = build :user, password: "hi"
      expect { sign_up(monkey) }.not_to change(User, :count)
      expect(current_path).to eq "/users"
      expect(page).to have_content "Password and confirmation password do not match"
    end
    scenario "if no email given" do
      monkey = build :user, email: ""
      expect { sign_up(monkey) }.not_to change(User, :count)
      expect(current_path).to eq "/users"
      expect(page).to have_content "Please enter a valid email address"
    end
    scenario "if no name given" do
      monkey = build :user, name: ""
      expect { sign_up(monkey) }.not_to change(User, :count)
      expect(current_path).to eq "/users"
      expect(page).to have_content "Please enter your name"
    end
    scenario "if no username given" do
      monkey = build :user, username: ""
      expect { sign_up(monkey) }.not_to change(User, :count)
      expect(current_path).to eq "/users"
      expect(page).to have_content "Please enter the username you want to use"
    end
    scenario "if email is already tied to an account" do
      sign_up(build :user)
      expect { sign_up(build :user) }.not_to change(User, :count)
      expect(page).to have_content "Email already in use"
    end
    scenario "if username is already tied to an account" do
      sign_up(build :user)
      expect { sign_up(build :user, email: "swordsman@stawhats.com") }.not_to change(User, :count)
      expect(page).to have_content "Username taken"
    end
  end

  def sign_up(user)
    visit "/"
    click_link "Become a Chitter Peeper"
    expect(current_path).to eq "/users/new"
    fill_in "name", with: user.name
    fill_in "email", with: user.email
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    fill_in "password_confirmation", with: user.password_confirmation
    click_button "Sign up"
  end 
end