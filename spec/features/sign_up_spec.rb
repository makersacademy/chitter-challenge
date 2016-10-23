require_relative 'web_helper'

feature "User sign up" do
  scenario "I can sign up as a new user" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Hello Alice")
    expect(User.first.name).to eq("Alice")
    expect(User.first.user_name).to eq("alice")
    expect(User.first.email).to eq("alice@example.com")
  end

  scenario "Username or email already exist" do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(current_path).to eq "/users/new"
    expect(page).to have_content "Username or email is already taken. Try an alternative."
  end


end
