feature 'User sign in' do

  let!(:user) do
    User.create(name:     'Lan Pham',
                email:    'lan@example.com',
                username: 'Lan',
                password: '12345678',
                password_confirmation: '12345678')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome to Chitter, #{user.username}"
  end

end
