# frozen_string_literal: true

describe User do
  describe '.email_check' do
    it 'should return true if the email is not currently in use' do
      expect(User.email_check('a@b.com')).to eq(true)
    end
  end

  describe '.username_check' do
    it 'should return true if the username is not currently in use' do
      expect(User.username_check('@a')).to eq(true)
    end
  end

  describe '.password_check' do
    it 'should return true if the passwords match' do
      expect(User.password_check('1234', '1234')).to eq(true)
    end
  end
end
