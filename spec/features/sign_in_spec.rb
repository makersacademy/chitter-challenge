feature 'User sign in' do

  let!(:user) do
    User.create(email: 'jackdopeyman@hotmail.com',
                password: 'password1234',
                password_confirmation: 'password1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end
