require 'spec_helper'

feature 'allow user to register account' do
  scenario 'sign up user' do
    expect { sign_up(email: 'mat@makers.com', username: 'mat') }.to change{User.count}.by(1)
    expect(page).to have_content "Welcome, mat! Please find the latest cheeps below"
    expect(User.first.email).to eq 'mat@makers.com'
  end

  scenario "validating password confirmation" do
    expect { sign_up(password_confirmation: 'abc123') }.not_to change {User.count}
    expect(page).to have_content('Passwords don\'t match: please reenter your password')
  end
end
