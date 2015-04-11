require 'spec_helper'

feature 'user can sign up' do
  scenario 'when user visiting for first time' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, Iciar')
    expect(User.first.email).to eq 'iciar@icicleta.com'
  end

  xscenario 'when user use an email already used'

  xscenario 'when user use an username already taken'

  xscenario "when password confirmation doesn't match"

  def sign_up(email = "iciar@icicleta.com",
              name = "Iciar",
              username = "Icicleta",
              password = "holaCaracola",
              password_confirmation = "holaCaracola")
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end
end