feature "FEATURE: Signing Up" do

  scenario "correctly entered new user" do
    sign_up

    expect(User.all.count).to eq 1
    expect(page).to have_content 'Welcome, test'
    expect(User.first.email).to eq('test@test.com')
    expect(page.current_path).to eq '/peeps'
  end

  scenario "incorrectly entered password confirmation" do
    sign_up(password_confirmation: "wrongpassword")

    expect(User.all.count).to eq 0
    expect(page.current_path).to eq ('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "no email address entered" do
    sign_up(email: nil)

    expect(User.all.count).to eq 0
    expect(page.current_path).to eq ('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "incorrect email format" do
    sign_up(email: "test@test")

    expect(User.all.count).to eq 0
    expect(page.current_path).to eq ('/users')
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario "email address is not unique" do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page.current_path).to eq ('/users')
    expect(page).to have_content 'Email is already taken'
  end

  scenario "no username entered" do
    sign_up(username: nil)

    expect(User.all.count).to eq 0
    expect(page.current_path).to eq ('/users')
    expect(page).to have_content('Username must not be blank')
  end

  scenario "username is not unique" do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page.current_path).to eq ('/users')
    expect(page).to have_content 'Username is already taken'
  end

end

feature "FEATURE: Signing In" do
  let!(:user) { User.create(email: "test@test.com",
    password: "password", password_confirmation: "password",
    name: "Test Test", username: "test") }

    scenario "can sign in with correct email and password" do
    sign_in(username: user.username, password: user.password)
    expect(page.current_path).to eq "/peeps"
    expect(page).to have_content "Welcome, #{user.username}"
  end

end

  feature "FEATURE: Signing Out" do
    before (:each) { User.create(email: "test@test.com",
      password: "password", password_confirmation: "password",
      name: "Test Test", username: "test") }

    scenario "can sign out wehn signed in" do
      sign_in(username: 'test', password: 'password')
      click_button 'sign_out'
      expect(page).to have_content 'Goodbye!'
      expect(page).not_to have_content "Welcome, test"
    end
  end
