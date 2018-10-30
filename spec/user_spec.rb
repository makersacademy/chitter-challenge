require 'user'

describe User do
  describe 'tests setting and viewing user information' do
    it 'sets user email' do
      subject.set_email('email')
      expect(subject.get_email).to eq 'email'
    end
    it 'sets user password' do
      subject.set_email('password')
      expect(subject.get_email).to eq 'password'
    end
    it 'sets user name' do
      subject.set_email('name')
      expect(subject.get_email).to eq 'name'
    end
    it 'sets user username' do
      subject.set_email('username')
      expect(subject.get_email).to eq 'username'
    end
  end
end
