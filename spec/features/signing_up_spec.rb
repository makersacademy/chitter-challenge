require 'spec_helper'

feature 'Signing up' do
  scenario 'I can sign up as a new user' do
    user = create(:user)
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page.status_code).to eq(200)
    expect(page).to have_content "Welcome #{user.name}"
    expect(User.first.email).to eq('rebecca@example.com')
  end
end