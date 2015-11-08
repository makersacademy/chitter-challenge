feature 'Arriving at Chitter:' do
  context 'When arriving at the index page for Chitter' do
    scenario 'there is a sign-up link for new users' do
      visit('/')
      click_link('sign-up')
      expect(current_path).to eq '/users/sign-up'
    end

    scenario 'there is a log-in page for existing users' do
      visit('/')
      click_link('login')
      expect(current_path).to eq '/users/login'
    end
  end
end