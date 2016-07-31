feature 'Sign in' do

  let!(:user) do
    User.create(email: 'me@test.com',
                password: '12345',
                full_name: 'Testy McTestface',
                username: 'tester4lyf')
  end

  scenario 'user signs in with email and password' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Hey, #{user.full_name}"
  end
end
