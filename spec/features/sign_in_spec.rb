feature 'User sign in' do

  let(:user) do
    User.create(name: 'Robin Heathcote',
                username: 'robin1',
                email: 'robin@example.com',
                password: 'oranges!',
                password_confirmation: 'oranges!')
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username,   password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

end
