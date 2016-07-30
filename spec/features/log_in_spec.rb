# User Story 2:
# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Log in' do
  let!(:user) do
    User.create(username: 'Jonny',
                email: 'jonny@email.com',
                password: 'somepassword',
                password_confirmation: 'somepassword')
  end

  scenario 'I can log in with correct credentials' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome back to Chitter, #{user.username}"
  end

end
