# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Sign in:' do
  scenario 'User can sign into the system' do
    sign_up
    sign_in
    expect(page).to have_content 'Welcome, test@test.com'
  end
end
