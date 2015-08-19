feature 'User sign-up:' do
  scenario 'New user can sign up with email, name, username & password' do
    # user = build :user
    user = build(:user)
    expect{ sign_up(user) }.to change(User, :count).by(1)
    retrieved_user = User.first()
    expect(retrieved_user.name).to eq('first last')
  end

  scenario 'New user cannot sign up with duplicate email' do
    user1 = build(:user)
    sign_up(user1)
    user2 = build(:user, username: 'different')
    expect{ sign_up(user2) }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'New user cannot sign up with duplicate username' do
    user1 = build(:user)
    sign_up(user1)
    user2 = build(:user, email: 'different')
    expect{ sign_up(user2) }.to_not change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

  scenario 'New user cannot sign up without providing email address' do
    user = build(:user, email: '')
    expect{ sign_up(user) }.to_not change(User, :count)
  end

  scenario 'New user cannot sign up without providing name' do
    user = build(:user, name: '')
    expect{ sign_up(user) }.to_not change(User, :count)
  end

  scenario 'New user cannot sign up without providing username' do
    user = build(:user, username: '')
    expect{ sign_up(user) }.to_not change(User, :count)
  end

  scenario 'Unsucceful attempt to create account refreshes the page' do
    user1 = build(:user)
    sign_up(user1)
    user2 = build(:user)
    expect{ sign_up(user2) }.to_not change(User, :count)
    expect(page).to have_content('Please enter a password for your new account')
  end

end
