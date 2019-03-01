require './lib/user.rb'

feature 'authentication' do
  let(:username) { 'simon88' }
  let(:password) { 'penmousekeys' }

  def submit_username_password
    fill_in('username', with: username)
    fill_in('password', with: password)
    click_button 'Submit'
  end

  feature 'when new user registers' do
    scenario 'should save new username' do
      visit('/register')
      submit_username_password

      expect(User.all[0].username).to eq(username)
    end
  end

  feature 'when user logs in' do
    scenario 'should load feed if valid login details submitted' do
      User.create(username: username, password: password)
      
      visit('/login')
      submit_username_password

      expect(page.current_path).to eq '/feed'
    end
  end
end
