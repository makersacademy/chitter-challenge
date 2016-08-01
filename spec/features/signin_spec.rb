feature 'User sign in' do

  let!(:user) do
    User.create(full_name: 'User',
                username: 'user100',
                email: 'test100@test.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username,   password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

end
