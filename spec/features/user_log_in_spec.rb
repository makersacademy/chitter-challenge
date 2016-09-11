feature "User login" do

  let!(:user) do
    User.create(username: 'mrmurtz',
                email: 'murtz@gmail.com',
                password:  '1234',
                password_confirmation: '1234')
  end

  scenario "as an existing user I can log in to see a welcome message" do
    log_in
    expect(current_path).to eq '/timeline'
    expect(page).to have_content "Welcome mrmurtz"
  end

  scenario 'show generic error if wrong password entered' do
    log_in(password: '4321')
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'Username or password incorrect'
  end
end
