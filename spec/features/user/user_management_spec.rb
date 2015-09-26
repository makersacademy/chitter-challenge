feature 'When signing up' do

  scenario 'user can sign up' do
    user = build(:user)
    expect{sign_up(user)}.to change(User, :count).by (1)
    expect(page).to have_content("Welcome, #{user.username}")
    expect(User.first.email).to eq("#{user.email}")
  end

  scenario 'user can sign in' do
    user = build(:user)
    sign_up(user)
    sign_in(user)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'user can sign out' do
    user = build(:user)
    sign_up(user)
    sign_in(user)
    sign_out
    expect(page).to have_content "Goodbye!"
  end

  scenario 'email required to sign-in' do
    no_email = build(:user, email: nil)
    sign_up(no_email)
    click_button 'Sign up'
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'username required to sign-in' do
    no_username = build(:user, username: nil)
    sign_up(no_username)
    click_button 'Sign up'
    expect(page).to have_content "Username must not be blank"
  end

  scenario 'email must be unique' do
    sign_up(build(:user))
    sign_up(build(:user))
    expect(page).to have_content "Email is already taken"
  end

  scenario 'password confirmation must match to register' do
    sign_up(build(:user, password: 'bla'))
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'password field cannot be blank to register' do
    sign_up(build(:user, password: nil, password_confirmation: nil))
    expect(page).to have_content 'Password must not be blank'
  end

  scenario 'username must be unique' do
    sign_up(build(:user))
    sign_up(build(:user))
    expect(page).to have_content 'Username is already taken'
  end


end