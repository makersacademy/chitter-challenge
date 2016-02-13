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
    visit('/')
    click_link "Log in"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in"
    expect(page).to have_content "Welcome, bigbob"
  end
end

