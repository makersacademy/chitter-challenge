feature "Registered users can log in" do

  let(:maker) do
    Maker.create( name: 'Alaan',
                  username: 'Alaanzr',
                  email: 'Alaanzr@gmail.com',
                  password: 'password')
  end

  scenario "A user logs in successfully when supplying the correct credentials" do
    Maker.create(name: 'Alaan', username: 'Alaanzr', email: 'Alaanzr@gmail.com', password: 'password')
    sign_in(maker.name, maker.username, maker.email, maker.password)
    expect(page).to have_content("Welcome #{maker.name}!")
  end

  scenario "A user receives an error message when they attempt to sign in with an incorrect password" do
    sign_in(maker.name, maker.username, maker.email, 'incorrect password')
    expect(page).to have_content('Incorrect username or password')
  end
end
