feature 'Makers sign up' do
  context 'successfully' do
    scenario 'makers can sign up' do
      sign_up('test@testing.com', 'secret', 'secret', 'Test Bloggs', 'testy')
      expect(page).to have_content 'Welcome to Chitter, testy!'
      expect(User.all.count).to eq 1
    end
  end

  context 'unsuccessfully' do
    scenario 'without e-mail, password, name or username' do
      sign_up('', '', '', '', '')
      expect(User.all.count).to eq 0
      expect(current_path).to eq '/users/new'
    end

    scenario 'with inconsistent passwords' do
      sign_up('test@testing.com', 'secret', 'different_secret', 'Test Bloggs', 'testy')
      expect(User.all.count).to eq 0
      expect(current_path).to eq '/users/new'
    end

    scenario 'with duplicate e-mail or username' do
      sign_up('test@testing.com', 'secret', 'secret', 'Test Bloggs', 'testy')
      sign_up('test@testing.com', 'secret', 'secret', 'Test Bloggs', 'different_testy')
      expect(User.all.count).to eq 1
      sign_up('differenttest@testing.com', 'secret', 'secret', 'Test Bloggs', 'testy')
      expect(User.all.count).to eq 1
      expect(current_path).to eq '/users/new'
    end
  end
end
