# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Loggin in' do
  let(:user) do
    User.create(name: 'user',
                username: 'userfoo',
                email: 'user@example.com',
                password: 'foobar',
                password_confirmation: 'foobar')
  end

  scenario 'with correct credentials' do
      sign_in(username: user.username,   password: user.password)
      expect(page).to have_content "Hello, #{user.username}!"
  end
end
