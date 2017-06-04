# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'User sign in' do

  let!(:user) do
    User.create(email: 'john@doe.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end
