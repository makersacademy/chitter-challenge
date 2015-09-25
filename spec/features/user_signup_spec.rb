feature 'user sign up' do

  scenario 'user can see sign up at home page' do
    visit '/'
    expect(page).to have_button 'Sign up'
  end

  scenario 'user can sign up' do
    user = build :user
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Hello #{user.name}"
  end

  scenario 'must enter valid name' do
    user = build :user, name: nil
    expect { sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content 'Name must not be blank'
  end

  scenario 'must enter valid username' do
    user = build :user, username: nil
    expect { sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'username must be unique' do
    user = create :user
    user2 = build :user
    expect { sign_up(user2) }.not_to change(User, :count)
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'email must be unique' do
    user = create :user
    user2 = build :user
    expect { sign_up(user2) }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'must enter valid email' do
    user = build :user, email: nil
    expect { sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'must enter valid passwords' do
    user = build :user, password: '321'
    expect { sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'cannot signup after signed in' do
    user = build :user
    sign_up(user)
    visit '/user/new'
    expect(page).to have_content "You're already signed in"
  end
end