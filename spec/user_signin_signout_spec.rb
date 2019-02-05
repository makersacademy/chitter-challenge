# frozen_string_literal: true

describe User do
  describe '.sign_in_check' do
    it 'should return true if the username and password are in the database' do
      make_a_user

      expect(User.sign_in_check('c@d.com', '1234')).to eq(true)
    end
  end

  describe '.sign_in' do
    it 'should sign the user in' do
      make_a_user

      User.sign_in('c@d.com')

      expect(User.user_id).to eq(1)
      expect(User.username).to eq('@a')
    end
  end

  describe '.sign_out' do
    it 'sets the signed out values to prevent peeping as someone else' do
      User.sign_out

      expect(User.user_id).to eq(0)
      expect(User.username).to eq('not signed in')
    end
  end
end
