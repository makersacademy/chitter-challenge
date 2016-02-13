feature 'Users can log in' do
  let(:user) do
    User.create(
      name: "Bob",
      username: "bigbob",
      email: "Bob@email.com",
      password: "123abc",
      password_confirmation: "123abc"     
    )
  end 

  scenario 'User can log in with email and password' do
    log_in(email: user.email, password:  user.password)
    expect(page).to have_content "Welcome, bigbob"
  end
end

