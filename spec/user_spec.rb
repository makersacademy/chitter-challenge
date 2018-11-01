require 'user'

describe User do
  describe 'tests setting and viewing user information' do
    it 'sets and views user email' do
      subject.change_email('email')
      expect(subject.view_email).to eq 'email'
    end
    it 'sets and views user password' do
      subject.change_password('password')
      expect(subject.view_password).to eq 'password'
    end
    it 'sets and views user name' do
      subject.change_name('name')
      expect(subject.view_name).to eq 'name'
    end
    it 'sets and views user username' do
      subject.change_username('username')
      expect(subject.view_username).to eq 'username'
    end
    it 'sets and views user id' do
      subject.change_email('email')
      subject.change_password('password')
      subject.change_name('name')
      subject.change_username('username')
      subject.change_userid
      expect(subject.view_username).to eq 1
    end
  end
end
