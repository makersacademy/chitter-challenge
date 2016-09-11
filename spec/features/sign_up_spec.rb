require 'spec_helper'

feature 'registering users' do

  scenario 'sign up a user' do
    expect { sign_up }.to change(User, :count).by(1)
    new_user = User.first
    expect(new_user.email).to eq('dennis@themenace.ha')
    expect(page).to have_content 'Welcome, Dennis'
  end
end
