require 'spec_helper'

feature "User signs up" do

  scenario "when a new user visits the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Kev")
    expect(User.first.email).to eq("kevinlanzon@gmail.com")
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('Kev','superkev', 'kevinlanzon@gamil.com', 'pass', 'wrong')}.to change(User, :count).by(0)
  end

  def sign_up(name = "Kev",
              username = "superkev",
              email = "kevinlanzon@gmail.com",
              password = "chitbags",
              password_confirmation = "chitbags")

    visit '/users/new'
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"

  end



end