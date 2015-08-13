require "spec_helper"

feature "user signing up" do
  scenario "can sign up if all ok" do
    monkey = build :user
    expect { sign_up(monkey) }.to change(User, :count).by 1
    expect(page).to have_content "What's peeping #{monkey.name}?"
    expect(User.first.email).to eq monkey.email
    expect(User.first.username).to eq monkey.username
  end

  scenario "cannot sign up if confirmation password different" do
    monkey = build :user, password: "hi"
    expect { sign_up(monkey) }.not_to change(User, :count)
    expect(current_path).to eq "/users"
    expect(page).to have_content "Password and confirmation password do not match"
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