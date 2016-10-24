feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@tester.com')
    expect(User.first.email).to eq('test@tester.com')
  end

  scenario "requires a matching comfirmation password" do
    expect { sign_up(password_confirmation: "not_the_same_as_first_password")}.not_to change(User, :count)
  end

  scenario "with a password that does not match" do
    expect {sign_up(password_confirmation: "not_the_same_as_first_password")}.not_to change(User, :count)
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "I cannot sign up with an existing email" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content("Email is already taken")
  end

end

feature "User sign in" do

  let!(:user) do
    User.create(email: 'user@example.com',
                name: "J. E. Hoover",
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario "with correct credentials" do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

end

feature "User sign out" do

  before(:each) do
    User.create(email: 'test@test.com',
                name: "E. A. Poe",
                password: 'test',
                password_confirmation: 'test')
  end

  scenario "while being signed in" do
    sign_in(email: 'test@test.com', password: 'test')
    click_button "Sign out"
    expect(page).to have_content "Goodbye!"
    expect(page).not_to have_content("Welcome, test@test.com")
  end

end
