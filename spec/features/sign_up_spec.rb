# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "New user should be able to register/sign up" do

  before (:each) do
    User.create(email: 'existing@email.com', password: 'test', password_confirmation: 'test', name: 'Ex Name', username: 'ename')
  end

  scenario "allows user to sign up with all the details" do
    sign_up
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content('Welcome, ewindsor')
  end

  scenario "doesn't allow user to sign up without email" do
    sign_up(email: nil, password: '12345678', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: 'ewindsor')
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('We need your email address.')
  end

  scenario "doesn't allow user to sign up without username" do
    sign_up(email: 'test@test.com', password: '12345678', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: nil)
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('We need you to enter a username')
  end

  scenario "doesn't allow user to sign up with invalid email " do
    sign_up(email: 'test@test', password: '12345678', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: nil)
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content("Doesn't look like an email address to me ...")
  end

  scenario "doesn't allow user to sign up with an existing email" do
    sign_up(email: 'existing@email.com', password: '12345678', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: 'ewindsor')
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content("We already have that email.")
  end

  scenario "doesn't allow user to sign up if password and confirm password don't match" do
    sign_up(email: 'alice@example.com', password: '123456789', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: 'ewindsor')
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('Password and confirmation password do not match')
  end

  scenario "doesn't allow user to sign up without a unique username" do
    sign_up(email: 'alice@example.com', password: '12345678', password_confirmation: '12345678', name: 'Elizabeth Windsor', username: 'ename')
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('We already have that username.')
  end

end
