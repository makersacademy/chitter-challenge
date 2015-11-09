feature "login" do

  let(:maker) do
    Maker.create(name: 'John Wright',
                 email: 'john@gmail.com',
                 username: 'JohnW',
                 password: '123456',
                 password_confirmation: '123456')
  end

  scenario "is granted with correct credentials" do
    login(username: maker.username, password: maker.password)
    expect(page).to have_content "Welcome, #{maker.name}"
  end

  scenario "is not granted with incorrect credentials" do
    login(username: maker.username, password: 'wrong_password')
    expect(page).to have_content 'The username or password is incorrect'
  end
end
