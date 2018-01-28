feature 'User sign in' do
  let!(:new_user) do
    User.create(email: '123@123.com',
                password: 'password',
                password_confirmation: 'password',
                name: 'Bob',
                username: 'Alice')
  end

  scenario 'I want to log in to Chitter' do
    sign_in(email: new_user.email, password: 'password')
    expect(page).to have_content "Welcome, #{new_user.name}"
  end
end
