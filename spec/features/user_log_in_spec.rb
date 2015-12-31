feature 'User log in' do

  let(:user) do
    User.create(name:                   'Example Name',
                username:               'example',
                email:                  'example@gmail.com',
                password:               'password',
                password_confirmation:  'password')
  end

  scenario 'There is a log in option' do
    visit '/users/new'
    expect(page).to have_content "Log In"
  end

  scenario 'can log in with correct credentials' do
    sign_in(username: user.username,   password: user.password)
    expect(page).to have_content "Welcome #{user.name}"
  end

  def sign_in(username:               'example',
              password:               'password')
      visit '/users/new'
      fill_in 'existing_username', with: username
      fill_in 'existing_password', with: password
      click_button('Log In')
  end


end
