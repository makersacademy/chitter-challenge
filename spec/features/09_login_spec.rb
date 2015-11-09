feature "login" do

  let(:maker) do
    Maker.create(name: 'David Wright',
                 email: 'David.Wright@gmail.com',
                 username: 'DWright',
                 password: 'letmein',
                 password_confirmation: 'letmein')
  end

  scenario "is granted with correct credentials" do
    valid_sign_up
    login(username: maker.username, password: maker.password)
    expect(page).to have_content "Welcome, #{maker.name}"
  end

  scenario "is not granted with incorrect credentials" do
    login(username: maker.username, password: 'wrong_password')
    expect(page).to have_content 'The username or password is incorrect'
  end
end
