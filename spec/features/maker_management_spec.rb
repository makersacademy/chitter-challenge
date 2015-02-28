require 'spec_helper'

feature "Maker signs up" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(Maker, :count).by(1)
    expect(page).to have_content("Welcome, Lorisfo")
    expect(Maker.first.username).to eq("Lorisfo")
  end

  scenario "with a password that doesn't match" do
    expect{ sign_up('Loris Fochesato', 'Lorisfo', 'loris@example.com', 'pass', 'wrong')}.to change(Maker, :count).by(0)
    expect(current_path).to eq('/makers')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  scenario "with an email or a username that is already registered" do
    expect{ sign_up}.to change(Maker, :count).by(1)
    expect{ sign_up}.to change(Maker, :count).by(0)
    expect(page).to have_content("This email is already taken")
    expect(page).to have_content("This username is already taken")
  end

  def sign_up(name = "Loris Fochesato",
              username = "Lorisfo",
              email = "loris@example.com",
              password = "Ruby!",
              password_confirmation = "Ruby!")
    visit '/makers/new'
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

end

