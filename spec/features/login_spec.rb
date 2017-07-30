feature "User log in" do
  let!(:user) do
    User.create(email: 'pug@gmail.com', name: 'Pug', username: '@puggy',
     password: 'password', password_confirmation: 'password')
  end

  scenario 'with correct credentials' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome #{user.email}"
  end
end
