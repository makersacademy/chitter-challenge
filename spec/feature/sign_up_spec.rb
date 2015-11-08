feature 'On sign-up' do

  before :each do
    sign_up
  end

  scenario 'the user count increases' do
    expect(User.count).to be 1
  end

  context 'the following fields must be unique:' do
    scenario 'username' do
      expect{ sign_up(username: 'user1') }.to_not change(User, :count)
      expect(current_path).to eq('/users/new')
      expect(page).to have_content('Username taken')
    end
    scenario 'email' do
      expect{ sign_up(email: 'user1@users.com') }.to_not change(User, :count)
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
    scenario 'name' do
      expect{ sign_up(name: '') }.to_not change(User, :count)
      expect(current_path).to eq('/users/new')
      expect(page).to have_content('Name can not be blank')
    end
    scenario 'username' do
      expect{ sign_up(username: '') }.to_not change(User, :count)
      expect(current_path).to eq('/users/new')
      expect(page).to have_content('Name can not be blank')
    end
    scenario 'password' do
      expect{ sign_up(password: '') }.to_not change(User, :count)
      expect(current_path).to eq('/users/new')
      expect(page).to have_content('Password can not be blank')
    end
  end

end
