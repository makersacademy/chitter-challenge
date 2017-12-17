feature 'users can sign in' do
  let!(:user) do
    User.create(email: 'yan@example.com',
                name: 'Yan',
                username: 'yanny',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario "with correct credentials" do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
  end
