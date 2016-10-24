require 'spec_helper'

describe User do
  let!(:user) { User.create(email:                  'test@test.com',
                            username:               'tester',
                            password:               'test',
                            password_confirmation:  'test') }


  describe '#signin' do
    it 'Authenticates a user' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'returns error for failed user authentication' do
      expect(User.authenticate(user.email, 'incorrect_password')).to be_nil
    end
  end
end
