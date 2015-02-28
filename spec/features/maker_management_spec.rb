require 'spec_helper'

feature "Maker signs up" do

  scenario "when being a new user visiting the site" do
    expect{ sign_up }.to change(Maker, :count).by(1)
    expect(page).to have_content("Welcome, Lorisfo")
    expect(Maker.first.username).to eq("Lorisfo")
  end

  def sign_up(name = "Loris Fochesato",
              username = "Lorisfo",
              email = "loris@example.com",
              password = "Ruby!",
              password_confirmation = "Ruby!")
    visit '/makers/new'
    expect(page.status_code).to eq(200)
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button "Sign up"
  end

end

