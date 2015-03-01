require 'spec_helper'

feature "User signs up" do

  scenario 'when signing up I should change user count' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq("alice@example.com")
    expect(User.first.name).to eq("alice")
  end

  scenario 'after signing up User should see custom greeting' do
    sign_up
    expect(page).to have_content("Welcome, alice101")
  end

  scenario "users tries to signup with a password that doesn't match" do
    expect{ sign_up('alice','a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Password does not match")
  end

  scenario "user tries to signup with an email that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("This email is already taken")
  end


  def sign_up(name = "alice",
              username = "alice101",
              email = "alice@example.com",
              password = "oranges!",
              password_confirmation = "oranges!")
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

end