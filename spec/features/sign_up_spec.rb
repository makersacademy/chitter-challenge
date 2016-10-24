require 'spec_helper'

feature 'signing up' do

  scenario "signing up creates a new user" do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario "can't sign up if password and password confirmation don't match" do
    expect { sign_up(confirm_password: 'wrongpassword') }.to change(User, :count).by(0)
  end

  context "after signing up" do
    before(:each) do
      sign_up
    end

    scenario 'signing up redirects to home' do
      expect(page.current_path).to eq '/'
    end


    scenario 'home page greets user' do
      expect(page).to have_text('Welcome, Tim')
    end

    scenario "User details are added to database" do
      expect(User.first.username).to eq "Bubbles"
      expect(User.first.name).to eq "Tim"
      expect(User.first.email).to eq "bubble@bubbles.com"
    end
  end
end
