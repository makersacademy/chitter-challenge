require 'login_helper'
require 'user_repository'

RSpec.describe LoginHelper do
  before(:each) do
    reset_tables
    @users = UserRepository.new.all
  end

  it 'checks whether any users are logged in' do
    helper = LoginHelper.new(@users)
    result = helper.any_logged_in?

    expect(result).to eq false
  end

  describe 'login' do
    it 'logs in a user' do
      helper = LoginHelper.new(@users)
      repo = UserRepository.new
      user_to_login = @users[0]
      helper.login(user_to_login)

      expect(repo.find(1).logged_in).to eq 't'
    end

    it 'fails if a user already logged in' do
      helper = LoginHelper.new(@users)
      helper.login(@users[0])
      puts "First user logged in: #{@users[0].logged_in}"

      expect { helper.login(@users[1]) }.to raise_error "A user is already logged in"
    end
  end

  describe '#logged_in_user' do
    it 'returns the ID of the logged in user' do
      helper = LoginHelper.new(@users)
      helper.login(@users[0])
      result = helper.logged_in_user

      expect(result).to eq(1)
    end

    it 'returns nil if no users logged in' do
      helper = LoginHelper.new(@users)
      result = helper.logged_in_user
  
      expect(result).to eq(nil)
    end
  end

  describe 'logout' do
    it 'logs out a user' do
      helper = LoginHelper.new(@users)
      user = @users[0]
      helper.login(user)
      helper.logout(user)

      expect(user.logged_in).to eq false
    end

    it 'fails if the user is not logged in' do
      helper = LoginHelper.new(@users)

      expect { helper.logout(@users[0]) }.to raise_error "User is not logged in"
    end
  end
end