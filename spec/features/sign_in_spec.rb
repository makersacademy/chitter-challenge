feature 'Sign in' do

  let!(:user) do
    User.create(name: 'user',
                username: 'user1234',
                email: 'user@example.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome #{user.username}"
  end
end
