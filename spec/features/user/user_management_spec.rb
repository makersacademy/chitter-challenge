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

  scenario 'cannot sign up without an email' do
    no_email = build(:user, email: nil)
    sign_up(no_email)
    click_button 'Sign up'
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'cannot sign up without an username' do
    no_username = build(:user, username: nil)
    sign_up(no_username)
    click_button 'Sign up'
    expect(page).to have_content "Username must not be blank"
  end

  scenario 'cannot register duplicate emails' do
    sign_up(build(:user))
    sign_up(build(:user))
    expect(page).to have_content "Email is  already taken"
  end

end