feature 'sign up' do
  context 'successfully' do
    scenario 'makers can sign up' do
      sign_up('test@testing.com', 'secret', 'secret', 'Test Bloggs', 'testy')
      expect(page).to have_content 'Welcome to Chitter, testy!'
      expect(User.all.count).to eq 1
    end
  end

  context 'unsuccessfully' do
    scenario 'makers can\'t sign up with inconsistent passwords' do
      sign_up('test@testing.com', 'secret', 'different_secret', 'Test Bloggs', 'testy')
      # expect(page).to have_content 'Password does not match.'
      expect(User.all.count).to eq 0
    end

    scenario 'makers can\'t sign up with non-unique e-mail or username' do
      sign_up('test@testing.com', 'secret', 'secret', 'Test Bloggs', 'testy')
      sign_up('test@testing.com', 'secret', 'secret', 'Test Bloggs', 'different_testy')
      # expect(page).to have_content 'Username already taken.'
      expect(User.all.count).to eq 1
      sign_up('differenttest@testing.com', 'secret', 'secret', 'Test Bloggs', 'testy')
      # expect(page).to have_content 'E-mail address already in use.'
      expect(User.all.count).to eq 1
    end
  end
end
