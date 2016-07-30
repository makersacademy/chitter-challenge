feature 'User logs in' do

  let!(:user) do
    User.create(email: 'kluczynskib@gmail.com',
                name: 'Bart',
                username: 'bartklu',
                password: '12345',
                password_confirmation: '12345')
    end

    scenario 'with correct credentials' do
        log_in(email: user.email, password: user.password)
        expect(page).to have_content "Welcome, #{user.username}"
    end

    def log_in(email:, password:)
      visit '/sessions/new'
      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Log in'
    end


    it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.email, 'something_incorrect')).to be_nil
    end

  end
