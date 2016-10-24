feature 'User sign in' do

  let!(:user) do
    User.create(email: 'newuser@gmail.com',
                password: 'password123',
                password_confirmation: 'password123',
                username: 'newnew',
                name: 'mew')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end
