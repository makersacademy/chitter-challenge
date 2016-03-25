require_relative '../helpers/session'

feature 'signing up' do
  include Helpers
  scenario 'with correct credentials' do
    user = build(:user)
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome to Chitter, #{user.name}!"
  end
end
