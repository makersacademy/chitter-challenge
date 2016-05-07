feature 'User log in' do

  let(:user) do
    User.create(name: 'Marley',
                username: 'Luni',
                email: 'marley@cat.com',
                password: 'dreamies',
                password_confirmation: 'dreamies')
  end

  scenario 'Correct credentials' do
    log_in(name: user.name, username: user.username, email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}!"
  end

end
