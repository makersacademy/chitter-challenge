feature 'User sign in' do
  let(:user) do
    User.create(name: 'First User',
            username: 'number1',
            email: 'user@email.com',
            password: 'terriblepassword1',
            password_confirmation: 'terriblepassword1')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end





end
