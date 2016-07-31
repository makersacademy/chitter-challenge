feature 'Sign in' do

  let!(:user) do
    User.create(name: 'example',
                username: 'example93',
                email: 'user@example.com',
                password: '12345',
                password_confirmation: '12345')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome #{user.username}"
  end
end
