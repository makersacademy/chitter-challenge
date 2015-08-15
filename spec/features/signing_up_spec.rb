require 'spec_helper'

feature 'Signing up' do
  scenario 'I can sign up as a new user' do
    user = create(:user)
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page.status_code).to eq(200)
    expect(page).to have_content "Welcome #{user.username}"
    expect(User.first.email).to eq('rebecca@example.com')
  end

  scenario 'requires a matching confirmation password' do
    user = build(:wrong_password_user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Please refer to the following errors below: Password does not match the confirmation'
  end
end