require 'spec_helper'

describe Users do
  let!(:user) do
    Users.create(username: 'MJ', email: 'michael@jackson5.com', password:'beatit', password_confirmation:'beatit')
  end

  describe '#authenticate' do
    it 'does not authenticate when given an incorrect password' do
      expect(Users.authenticate(user.username, 'wrong_stupid_username')).to be_nil
    end

  end
end