feature "User sign in" do

  let (:user) do
    User.create(name: 'Ivan Sathianathan', username: 'ivan', email: 'ivan@test.com', password: '12345', password_confirmation: '12345')
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end
end
