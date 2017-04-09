feature 'User authentication' do

  let!(:user) do
    User.create(email: 'b@tle.com',
                password: 's3cr3t',
                password_confirmation: 's3cr3t',
               name: 'Alex',
               username: 'AJ')
  end
  scenario 'checks a user can sign in with correct credentials' do
    sign_in(user.email, user.password)
    expect(page).to have_content("Welcome to Message in a bottle, #{user.username}")
  end
end
