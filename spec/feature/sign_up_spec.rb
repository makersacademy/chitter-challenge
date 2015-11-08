feature 'On sign-up' do

  before :each do
    sign_up(email: 'user0@users.com', username: 'user0')
  end

  scenario 'the user count increases' do
    expect(User.count).to be 1
  end

  scenario 'the passwords must match' do
    expect{ sign_up(password_confirmation: 'x') }.to_not change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Password does not match the confirmation')
  end

  context 'the following fields must be unique:' do
    scenario 'username' do
      expect{ sign_up(username: 'user0') }.to_not change(User, :count)
      expect(current_path).to eq('/users/new')
      expect(page).to have_content('Username taken')
    end
    scenario 'email' do
      expect{ sign_up(email: 'user0@users.com') }.to_not change(User, :count)
      expect(current_path).to eq('/users/new')
      expect(page).to have_content('Email already registered')
    end
  end

  context 'the following fields must not be blank:' do
    scenario 'email' do
      expect{ sign_up(email: '') }.to_not change(User, :count)
      expect(current_path).to eq('/users/new')
      expect(page).to have_content('Email can not be blank')
    end
    scenario 'username' do
      expect{ sign_up(username: '') }.to_not change(User, :count)
      expect(current_path).to eq('/users/new')
      expect(page).to have_content('Username can not be blank')
    end
    scenario 'password' do
      expect{ sign_up(password: '', password_confirmation: '') }
        .to_not change(User, :count)
      expect(current_path).to eq('/users/new')
      expect(page).to have_content('Password must be at least 6 characters')
    end
  end

  context 'the following field must be formatted correctly:' do
    scenario 'email' do
      expect{ sign_up(email: 'user1@users') }.to_not change(User, :count)
      expect(current_path).to eq('/users/new')
      expect(page).to have_content('Invalid email format')
    end
  end

end
