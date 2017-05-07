feature 'User sign in' do

  let!(:user) do
    User.create(name: 'Joe',
                user_name: 'Joe123',
                email: 'joe@example.com',
                password: 'secret')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end

end
