require 'spec_helper'

describe User do
  let(:user) { User.create(name: 'Tadas', email: 'tadas@gmail.com',
                           username: 'tadan', password: 'tadadoo',
                           password_confirmation: 'tadadoo') }

  describe '.authenticate' do
    it 'authenticates when given a valid email address and password' do
      expect(User.authenticate(user.email, user.password)).to eq user
    end

    it 'doesnt authenticate when given a wrong password' do
      expect(User.authenticate(user.email, 'wrong')).to be_nil
    end
  end
end
