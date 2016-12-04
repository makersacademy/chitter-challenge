feature 'User log in' do
  let!(:user) do
    User.create(username: 'Example',
                name: 'Ex Zample',
                email: 'user123@example.com',
                password: 'secret123',
                password_confirmation: 'secret123')
  end

  scenario 'with correct credentials' do
    log_in(username: user.username, password: user.password)
    expect(page).to have_content("Hello, #{user.username}")
  end
end
