# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'Sign up' do
  scenario 'User can sign up to Chitter' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter Mannie'
  end
end
