# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'User logs in' do
  xscenario 'with correct credentials' do
    sign_up
    log_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end
end
