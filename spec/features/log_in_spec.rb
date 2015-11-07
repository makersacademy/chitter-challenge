feature "Registered users can log in" do

  let(:maker) do
    Maker.create( name: 'Alaan',
                  username: 'Alaanzr',
                  email: 'Alaanzr@gmail.com',
                  password: 'password')
  end

  def sign_in(name, username, email, password)
    visit('/')
    fill_in('name', with: name)
    fill_in('username', with: username)
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button('Sign in')
  end

  scenario "A user logs in successfully when supplying the correct credentials" do
    sign_in(maker.name, maker.username, maker.email, maker.password_digest)
    expect(page).to have_content("Welcome #{maker.name}!")
  end

  scenario "A user receives an error message when they attempt to sign in with an incorrect password" do
    sign_in(maker.name, maker.username, maker.email, 'incorrect password')
    expect(page).to have_content('Incorrect password')
  end
end
