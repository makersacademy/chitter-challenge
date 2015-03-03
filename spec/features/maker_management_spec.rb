require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

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
    expect(page).to have_content("Email is already taken")
    expect(page).to have_content("Username is already taken")
  end

end

  feature "Maker signs in" do

  before(:each) do
    Maker.create(:username => "Lorisfo",
                 :password => "Ruby!",
                 :password_confirmation => "Ruby!")
  end

  scenario "with correct infos" do
    visit '/'
    expect(page).not_to have_content("Welcome, Lorisfo")
    sign_in("Lorisfo", "Ruby!")
    expect(page).to have_content("Welcome, Lorisfo")
  end

  scenario "with incorrect infos" do
    visit '/'
    expect(page).not_to have_content("Welcome, Lorisfo")
    sign_in("Lorisfo", "Python!")
    expect(page).not_to have_content("Welcome, Lorisfo")
  end

end

feature "Maker signs out" do

  before(:each) do
    Maker.create(:username => "Lorisfo",
                 :password => "Ruby!",
                 :password_confirmation => "Ruby!")
  end

  scenario 'While being signed in' do
    sign_in('Lorisfo', 'Ruby!')
    click_button "Sign out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Welcome, Lorisfo")
  end

end

