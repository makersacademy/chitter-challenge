feature 'sign up for chitter' do
  scenario 'I can create a new user account' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, acsauk')
    expect(User.first.email).to eq('abc@xyz.com')
  end

  scenario "I cannot sign up when using passwords that don't match" do
    expect{ sign_up(password_confirmation: "1234") }.not_to change(User, :count)
    expect(current_path).to eq '/users/sign_up'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "If I make a mistake in the form I would like my email to persist" do
    sign_up(password_confirmation: nil)
    expect(page).to have_field('email', with:'abc@xyz.com')
  end

  scenario "I cannot sign up when leaving email blank" do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users/sign_up'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "I cannot sign up with an email in an invalid format" do
    expect{ sign_up(email: "abc@xyz") }.not_to change(User, :count)
    expect(current_path).to eq '/users/sign_up'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario "I cannot sign up using a duplicate email address" do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(current_path).to eq '/users/sign_up'
    expect(page).to have_content 'Email is already taken'
  end

  scenario "I cannot sign up when leaving username blank" do
    expect{ sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users/sign_up'
    expect(page).to have_content 'Username must not be blank'
  end

  scenario "I cannot sign up using a duplicate username" do
    sign_up
    expect{ sign_up(email: 'different@email.com') }.not_to change(User, :count)
    expect(current_path).to eq '/users/sign_up'
    expect(page).to have_content 'Username is already taken'
  end

  scenario "I cannot sign up when leaving name blank" do
    expect{ sign_up(name: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users/sign_up'
    expect(page).to have_content 'Name must not be blank'
  end
end

feature "sign in to chitter" do
  let! (:user) do
    User.create(username: "bobsmith1",
                name: "Bob Smith",
                email: 'bob@smith.com',
                password: 'password123',
                password_confirmation: 'password123')
  end

  scenario "with correct details" do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario "with incorrect details" do
    sign_in(username: user.username, password: "wrongpassword")
    expect(page).to have_content "The username or password is incorrect"
  end
end

feature "sign out of chitter" do
  before(:each) do
    User.create(username: "bobsmith1",
                name: "Bob Smith",
                email: "bob@smith.com",
                password: "password123",
                password_confirmation: "password123")
  end

  scenario "when signed in" do
    sign_in(username: "bobsmith1", password: "password123")
    click_button 'Sign out'
    expect(page).to have_content("So long, farewell, auf wiedersehen, adieu!")
    expect(page).not_to have_content("Welcome, bobsmith1")
  end

end
