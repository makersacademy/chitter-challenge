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
    it 'gets an error when creating a user with an email or username that already exists' do
      subject.change_email('email@gmail.com')
      subject.change_password('password123')
      subject.change_name('bob')
      subject.change_username('itsbob')
      subject.change_userid
      expect(subject.view_userid).to eq 'USERERROR-CREDENTIALSTAKEN'
    end
  end
end
