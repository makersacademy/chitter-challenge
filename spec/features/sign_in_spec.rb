feature "Signing in:" do
  let!(:user) do
    User.create(email:                 'user@example.com',
                password:              '123456789',
                password_confirmation: '123456789')
  end
  scenario "user can sign in" do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end
