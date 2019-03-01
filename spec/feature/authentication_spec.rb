require './lib/user.rb'
require_relative 'web_helper.rb'

feature 'authentication' do
  let(:username) { 'simon88' }
  let(:password) { 'penmousekeys' }

  feature 'when new user registers' do
    scenario 'should save new username' do
      register(username: username, password: password)

      expect(User.all[0].username).to eq(username)
    end
  end

  feature 'when user logs in' do
    scenario 'should load feed if valid login details submitted' do
      User.create(username: username, password: password)
      
      login(username: username, password: password)

      expect(page.current_path).to eq '/feed'
    end

    scenario 'should not login if details invalid' do
      User.create(username: username, password: password)
      
      login(username: 'otheruser', password: password)

      expect(page.current_path).to eq '/login'
    end

    scenario 'should inform user when details are invalid' do
      User.create(username: username, password: password)
      
      login(username: 'otheruser', password: password)

      expect(page.find('.login_error')).to have_content('Incorrect email or password')
    end
  end
end
