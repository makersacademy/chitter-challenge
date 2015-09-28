
feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up_as(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, yana')
    expect(User.first.user_name).to eq('yana')
  end

  scenario 'I can not sign up if user_name is taken' do
    user1 = build :user
    sign_up_as(user1)
    user2 = build(:user, email: 'anna@example.com')
    expect { sign_up_as(user2) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'User name is already taken'
  end

  scenario 'I can not sign up if e-mail is taken' do
    user1 = build :user
    sign_up_as(user1)
    user2 = build(:user, user_name: 'anna')
    expect { sign_up_as(user2) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email is already taken'
  end

end

feature 'Log in' do

  scenario 'I can log in with correct credentials' do
    user = create :user
    sign_in_as(user)
    expect(page).to have_content("Welcome, #{user.user_name}")
  end

  scenario 'I can not log in with incorrect credentials' do
    user = create :user
    visit '/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: 'wrong_stupid_password'
    click_button 'Sign in'
    expect(page).to have_content "The email or password is incorrect"
  end

end

feature 'User signs out' do

  scenario 'while being signed in' do
    user = create :user
    sign_in_as(user)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, yana')
  end

end