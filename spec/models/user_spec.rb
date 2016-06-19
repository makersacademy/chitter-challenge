require 'spec_helper'

describe User do
  let!(:user) do
    User.create(username: 'MJ', email: 'michael@jackson5.com', password:'beatit', password_confirmation:'beatit')
  end

  describe '#authenticate' do
    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.username, 'wrong_stupid_username')).to be_nil
    end

  end
end