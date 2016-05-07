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

  def log_in(name:, username:, email:, password:)
    visit '/sessions/new'
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log in'
  end

end
