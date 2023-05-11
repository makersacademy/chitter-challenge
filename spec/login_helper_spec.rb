require 'login_helper'
require 'user_repository'

RSpec.describe LoginHelper do
  before(:each) do
    reset_tables
  end

  it 'checks whether any users are logged in' do
    users = UserRepository.new.all
    helper = LoginHelper.new
    result = helper.any_logged_in?(users)

    expect(result).to eq false
  end

  describe '#logged_in_user' do
    it 'returns the ID of the logged in user' do
      repo = UserRepository.new
      repo.change_login_status(2)
      helper = LoginHelper.new
      result = helper.logged_in_user(repo.all)

      expect(result).to eq(2)
    end

    it 'returns nil if no users logged in' do
      repo = UserRepository.new
      helper = LoginHelper.new
      result = helper.logged_in_user(repo.all)
  
      expect(result).to eq(nil)
    end
  end

  describe '#check_password' do
    it 'returns true when password matches' do
      helper = LoginHelper.new
      result = helper.check_password(1, 'password01')

      expect(result).to eq true
    end

    it 'returns false when password does not match' do
      helper = LoginHelper.new
      result = helper.check_password(1, 'invalid01')

      expect(result).to eq false  
    end
  end
end