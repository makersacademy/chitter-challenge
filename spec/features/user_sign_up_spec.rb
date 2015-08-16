feature 'User sign up' do
  scenario 'with valid credentials' do
    user = build :user
    sign_up(user)
    expect(page).to have_content "Welcome, #{user.username}!"
    expect(User.first.email).to eq user.email
  end

  scenario 'with incorrect password_confirmation' do
    user = build :user, password_confirmation: "wrong"
    expect { sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'I must enter an email' do
    user = build :user, email: ""
    expect { sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'I cannot use the same email address twice' do
    user = build :user
    sign_up(user)
    expect{ sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end

  scenario 'I cannot use the same username twice' do
    user = build :user
    sign_up(user)
    user2 = build :user, email: "second@example.com"
    expect{ sign_up(user2) }.not_to change(User, :count)
    expect(page).to have_content "Username is already taken"
  end
end

def sign_up(user)
  visit '/users/new'
  fill_in "username", with: user.username
  fill_in "email", with: user.email
  fill_in "password", with: user.password
  fill_in "password_confirmation", with: user.password_confirmation
  click_on "Sign Up"
end