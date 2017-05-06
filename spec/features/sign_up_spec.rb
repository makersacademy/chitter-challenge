require_relative '../web_helper'
feature '#sign_up' do
  scenario 'user signs up to Chitter' do
    sign_up
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome to Chitter, Spock.")
    expect(User.first.username).to eq("spock45")
  end

end
