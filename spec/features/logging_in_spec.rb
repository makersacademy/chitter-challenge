feature 'Logging in' do
  let(:user) do
    User.create(full_name: "Incredible Yev",
                email: "incredible@yev.com",
                password: "bla-bla-bla",
                password_confirmation: "bla-bla-bla")
  end

  scenario 'with correct credentials' do
    log_in(email: user.email,   
           password: user.password)
    expect(page).to have_content "Welcome, #{user.full_name}!"
  end

  scenario 'does not authenticate when given an incorrect password' do
    log_in(email: user.email,   
           password: "bla-bla-blu")
    expect(page).to have_content "The email or password is incorrect"
  end
end