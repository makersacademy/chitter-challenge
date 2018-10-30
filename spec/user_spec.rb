require 'user'

describe User do
  describe 'tests setting and viewing user information' do
    it 'sets and views user email' do
      subject.set_email('email')
      expect(subject.get_email).to eq 'email'
    end
    it 'sets and views user password' do
      subject.set_password('password')
      expect(subject.get_password).to eq 'password'
    end
    it 'sets and views user name' do
      subject.set_name('name')
      expect(subject.get_name).to eq 'name'
    end
    it 'sets and views user username' do
      subject.set_username('username')
      expect(subject.get_username).to eq 'username'
    end
  end
end
