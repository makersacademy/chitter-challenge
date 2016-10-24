require 'spec_helper'

describe User do
  let!(:user) { User.create(name:                   'Another test',
                            email:                  'test@test.com',
                            username:               'test',
                            password:               'test',
                            password_confirmation:  'test') }


  describe '#signin' do
    it 'Authenticates a user' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user.name).to eq user.name
      expect(authenticated_user.email).to eq user.email
      expect(authenticated_user.username).to eq user.username
    end

    it 'returns error for failed user authentication' do
      expect(User.authenticate(user.email, 'incorrect_password')).to be_nil
    end
  end
end
