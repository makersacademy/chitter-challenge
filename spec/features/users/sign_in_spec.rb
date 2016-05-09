feature 'User sign in' do

  let!(:user) do
    User.create(name: 'Alice Inne',
                username: 'Wonderland',
                email: 'alice@example.com',
                password: '12345678',
                password_confirmation: '12345678')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(current_path).to eq('/peeps')
    expect(page).to have_content "Welcome, #{user.email}"
  end
end
