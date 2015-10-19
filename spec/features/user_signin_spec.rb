feature 'user can sign in' do

  let(:user) do
    User.create(name: 'test',
                username: 'test',
                email: 'test@test.com',
                password: '12345',
                password_confirmation: '12345')
  end
  scenario 'can log into chitter' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome to Chitter, #{user.username}"
  end

  feature 'user signs out' do

    before(:each) do
      User.create(email: 'test@test.com',
                  password: '12345',
                  password_confirmation: '12345')
    end

    scenario 'user can sign out while being signed in' do
      sign_in(email: 'test@test.com', password: '12345')
      click_button 'Sign out'
      expect(page).to have_content('Goodbye!')
      expect(page).not_to have_content("Welcome to Chitter, #{user.username}")
    end
  end

  describe User do
    let!(:user) do
      User.create(email: 'test@test.com',
                  password: '12345',
                  password_confirmation: '12345')
    end

    it 'authenticates when given a valid email and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq(user)
    end

    it 'doesnt authenicate when given an invalid password' do
      expect(User.authenticate(user.email, 'wrong_password')).to be_nil
    end
  end

end
