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
