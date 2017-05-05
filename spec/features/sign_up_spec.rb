feature "User sign Up" do

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  scenario "new user signs up" do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, cat@catmail.com!"
    expect(User.first.email).to eq("cat@catmail.com")
  end

  scenario "no user created on mismatching password" do
    visit "/users/new"
    fill_in :email, with: "dog@dogmail.com"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "124"
    expect { click_button "Sign up" }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "user can't sign up without an email address" do
    visit "/users/new"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "123"
    expect { click_button "Sign up" }.not_to change(User, :count)
    expect(page).to have_content "Email must not be blank"
  end

  scenario "user can't sign up with an invalid email address" do
    visit "/users/new"
    fill_in :email, with: "cat@catmail"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "123"
    expect { click_button "Sign up" }.not_to change(User, :count)
    expect(page).to have_content "Email has an invalid format"
  end

  scenario "user can't sign up if email already exists" do
    sign_up
    visit '/users/new'
    fill_in :email, with: "cat@catmail.com"
    fill_in :password, with: "123"
    fill_in :password_confirmation, with: "123"
    expect { click_button "Sign up" }.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end
end