require 'user'

describe User do

  it 'should check if username is unique' do
    expect(User.user_exists?('testperson2')).to be false
  end

  it 'should add a user to the database' do
    User.add_user('testperson2', 'password', 'email@email.com')
    expect(User.user_exists?('testperson2')).to be true
  end

  it 'should return false if user does not exist' do
    expect(User.find_user('testperson2')).to be false
  end

  it 'should return the username and password based on the username' do
    expect(User.find_user('testperson1')).to be_an_instance_of(User)
  end

  it 'should return the username and password based on the username' do
    expect(User.login_correct?('testperson1', 'wrongpassword')).to be false
  end

  it 'should return the username and password based on the username' do
    expect(User.login_correct?('testperson1', 'wrongpassword')).to be false
  end

end
