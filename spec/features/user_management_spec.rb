feature 'User sign up' do

  scenario 'can sign up as a new user' do
    user = build :user
    sign_up_as(user)
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Hi, Natso'
    expect(User.first.email).to eq('natalie@gmail.com')
  end

  scenario 'can see labelled input fields' do
    visit '/users/new'
    expect(page).to have_content 'Email:'
    expect(page).to have_content 'Password:'
    expect(page).to have_content 'Confirm Password:'
    expect(page).to have_content 'Name:'
    expect(page).to have_content 'Username:'
  end

  scenario 'requires a matching confirmation password' do
    user = build :user, password: '1235'
    sign_up_as(user)
    expect(current_path).to eq ('/users')
    expect(page).to have_content 'Password does not match'
  end

  scenario 'does not display message if login failed' do
    user = build :user, password: '1235'
    sign_up_as(user)
    expect(page).not_to have_content 'Hi'
  end

  scenario 'requires a password to be entered' do
    user = build :user, password: '', password_confirmation: ''
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(page).to have_content 'Password must not be blank'
  end

  scenario 'requires a username to be entered' do
    user = build :user, username: ''
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'requires a name to be entered' do
    user = build :user, name: ''
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(page).to have_content 'Name must not be blank'
  end

  scenario 'requires an email address to be entered' do
    user = build :user, email: ''
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'requires a unique email address' do
    user = build :user
    dup_user = build :user, password: '1233', password_confirmation: '1233', name: 'Bob', username: 'Bobo'
    sign_up_as(user)
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'requires a unique username' do
    user = build :user
    dup_user = build :user, email: 'natalie@gmail.com', password: '1233', password_confirmation: '1233', name: 'Bob'
    sign_up_as(user)
    expect { sign_up_as(dup_user) }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end

feature 'User sign in' do

  scenario 'with correct credentials' do
    user = build :user
    sign_up_as(user)
    sign_in(user)
    expect(page).to have_content 'Hi, Natso'
  end
end

feature 'User sign out' do
  scenario 'while being signed in' do
    user = build :user
    sign_up_as(user)
    sign_in(user)
    click_button 'Sign out'
    expect(page).not_to have_content('Hi, Natso')
    expect(page).to have_content('Goodbye')
  end
end