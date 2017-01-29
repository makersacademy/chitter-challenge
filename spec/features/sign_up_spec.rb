feature 'FEATURE: sign up' do

  scenario 'Can click to sign up from home page' do
    visit('/')
    click_link('sign_up')
    expect(page.current_path).to eq "/users/new"
  end

  let(:name) { 'J T Kirk' }
  let(:email) { 'JTK@test.com' }
  let(:user_name) { 'TheShat' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }

  context 'Already signed in' do

    before do
      User.create(name: name, email: email, user_name: user_name, password: password, password_confirmation: password_confirmation)
    end

    scenario "cannot click to sign up" do
      sign_in(email, password)
      expect(page).not_to have_selector("#sign_up")
    end
  end

  scenario 'Can enter user details and create new user' do
    sign_up('James T Kirk', 'JTK@test.com', 'TheShat', 'password', 'password')
    expect(User.all.count).to eq 1
  end

  scenario 'Must enter a name' do
    sign_up('', 'JTK@test.com', 'TheShat', 'password', 'password')
    expect(page).to have_content("Name must not be blank")
  end

  scenario 'Must enter an email' do
    sign_up('James T Kirk', '', 'TheShat', 'password', 'password')
    expect(page).to have_content("Email must not be blank")
  end

  scenario 'Must enter a username' do
    sign_up('James T Kirk', 'JTK@test.com', '', 'password', 'password')
    expect(page).to have_content("User name must not be blank")
  end

  scenario 'Password and password conf must match' do
    sign_up('James T Kirk', 'JTK@test.com', 'TheShat', 'password', 'wrongpassword')
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'See multiple error messages if more than one field not validated' do
    sign_up('', 'JTK@test.com', '', 'password', 'password')
    expect(page).to have_content("User name must not be blank")
    expect(page).to have_content("Name must not be blank")
  end

  scenario 'email must be unique' do
    sign_up('James T Kirk', 'JTK@test.com', 'TheShat', 'password', 'password')
    click_button('sign_out')
    sign_up('Spock', 'JTK@test.com', 'TheVulcan', 'password', 'password')
    expect(page).to have_content("Email is already taken")
  end

  scenario 'username must be unique' do
    sign_up('James T Kirk', 'JTK@test.com', 'TheShat', 'password', 'password')
    click_button('sign_out')
    sign_up('Spock', 'spock@test.com', 'TheShat', 'password', 'password')
    expect(page).to have_content("User name is already taken")
  end

end
