# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'Sign up' do
  scenario 'display welcome message to new users' do
    sign_up
    expect(page).to have_content('Welcome chuck')
  end

  scenario 'increase user count by one upon sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
  end
end
