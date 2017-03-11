# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "New user should be able to register/sign up" do

  before (:each) do
    User.create(email: 'existing@email.com', password: 'test123', password_confirmation: 'test123', name: 'Ex Name', username: 'ename')
  end

  scenario "user can sign up all valid inputs" do
    sign_up
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content('Welcome, ewindsor')
  end

  scenario "email address cannot be left blank" do
    sign_up(email: nil, password: '12345678', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: 'ewindsor')
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('We need your email address.')
  end

  scenario "username cannot be left blank" do
    sign_up(email: 'test@test.com', password: '12345678', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: nil)
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('We need you to enter a username')
  end

  scenario "email address should be of valid format" do
    sign_up(email: 'test@test', password: '12345678', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: nil)
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content("Doesn't look like an email address to me ...")
  end

  scenario "email address should not already be registered with" do
    sign_up(email: 'existing@email.com', password: '12345678', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: 'ewindsor')
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content("We already have that email.")
  end

  scenario "password and confirm password should match" do
    sign_up(email: 'alice@example.com', password: '123456789', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: 'ewindsor')
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('Password and confirmation password do not match')
  end

  scenario "username needs to be unique" do
    sign_up(email: 'alice@example.com', password: '12345678', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: 'ename')
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('We already have that username.')
  end

  scenario "password needs to be atleast 6 chars long" do
    sign_up(email: 'alice@example.com', password: '12345', password_confirmation: '12345', name: 'Elizabeth Windsor', username: 'ename')
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content("Password is too short")
  end

end
