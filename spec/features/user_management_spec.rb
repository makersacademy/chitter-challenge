require "spec_helper"

feature "user signing up" do
  scenario "can sign up if all ok" do
    monkey = build :user
    expect { sign_up(monkey) }.to change(User, :count).by 1
    expect(page).to have_content "What's peeping #{monkey.name}?"
    expect(User.first.email).to eq monkey.email
    expect(User.first.username).to eq monkey.username
  end



  def sign_up(user)
    visit "/"
    click_link "Become a Chitter Peeper"
    expect(current_path).to eq "/users/new"
    fill_in "name", with: user.name
    fill_in "email", with: user.email
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_button "Sign up"
  end 
end