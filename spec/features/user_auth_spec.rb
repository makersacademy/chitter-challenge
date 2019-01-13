feature 'User Authentication' do
  context 'Signing up' do
    scenario 'A user can sign up' do
      signup

      expect(current_path).to eq '/profile'
      expect(page).to have_content 'Welcome, Joe King'
      expect(page).to have_content 'Email: lol@makers.com'
      expect(page).to have_content 'Username: haha88'
    end
  end
end
