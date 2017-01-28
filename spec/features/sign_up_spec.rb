feature 'FEATURE: sign up' do

  scenario 'Can click to sign up from home page' do
    visit('/')
    click_link('sign_up')
    expect(page.current_path).to eq "/users/new"
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
    sign_up('Spock', 'JTK@test.com', 'TheVulcan', 'password', 'password')
    expect(page).to have_content("Email is already taken")
  end

  scenario 'username must be unique' do
    sign_up('James T Kirk', 'JTK@test.com', 'TheShat', 'password', 'password')
    sign_up('Spock', 'spock@test.com', 'TheShat', 'password', 'password')
    expect(page).to have_content("User name is already taken")
  end

end
