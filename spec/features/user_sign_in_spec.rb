feature 'User sign in' do

  let!(:user) do
    User.create(email: 'anna@example.com',
                password: 'example',
                password_confirmation: 'example')
  end

  scenario 'signing in with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end
