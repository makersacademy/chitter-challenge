require "spec_helper"

feature "user signing up" do
  context "can sign up" do
    scenario "if all ok" do
      luffy = build :user
      expect { sign_up(luffy) }.to change(User, :count).by 1
      expect(page).to have_content "What's peeping #{luffy.name}?"
      expect(User.first.email).to eq luffy.email
      expect(User.first.username).to eq luffy.username
    end
  end
  context "cannot sign up" do
    scenario "if confirmation password different" do
      luffy = build :user, password: "hi"
      expect { sign_up(luffy) }.not_to change(User, :count)
      expect(current_path).to eq "/users"
      expect(page).to have_content "Password and confirmation password do not match"
    end
    scenario "if no email given" do
      luffy = build :user, email: ""
      expect { sign_up(luffy) }.not_to change(User, :count)
      expect(current_path).to eq "/users"
      expect(page).to have_content "Please enter a valid email address"
    end
    scenario "if no name given" do
      luffy = build :user, name: ""
      expect { sign_up(luffy) }.not_to change(User, :count)
      expect(current_path).to eq "/users"
      expect(page).to have_content "Please enter your name"
    end
    scenario "if no username given" do
      luffy = build :user, username: ""
      expect { sign_up(luffy) }.not_to change(User, :count)
      expect(current_path).to eq "/users"
      expect(page).to have_content "Please enter the username you want to use"
    end
    scenario "if email is already tied to an account" do
      luffy = create :user
      expect { sign_up(luffy) }.not_to change(User, :count)
      expect(page).to have_content "Email already in use"
    end
    scenario "if username is already tied to an account" do
      luffy = create :user
      expect { sign_up(build :user, email: "swordsman@stawhats.com") }.not_to change(User, :count)
      expect(page).to have_content "Username taken"
    end
  end 
end

feature "user signing in" do
  let(:luffy) { create :user }
  context "can sign in" do
    scenario "with correct credentials" do
      sign_in(luffy.email, luffy.password)
      expect(page).to have_content "What's peeping #{luffy.name}?"
    end
  end
  context "cannot sign in" do
    scenario "with incorrect email" do
      sign_in("Cook@strawhats.com", luffy.password)
      expect(page).to have_content "Email or password is incorrect."
    end
    scenario "with incorrect password" do
      sign_in(luffy.email, "Nami-swan-robin-chwan")
      expect(page).to have_content "Email or password is incorrect."
    end
  end
end

feature "user signs out" do
  let(:luffy) { create :user }
  scenario "when signed in" do
    sign_in(luffy.email, luffy.password)
    click_button "Peep ya later"
    expect(current_path).to eq "/"
    expect(page).not_to have_content "What's peeping #{luffy.name}?"
  end
end










