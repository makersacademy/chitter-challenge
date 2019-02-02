RSpec.describe User do

  it 'should return true when given a correct user/pass' do
    expect(User.check_password('al123', 'password123')).to eq true
  end

  it 'should return false when given a correct user/incorrect pass' do
    expect(User.check_password('al123', 'wrong')).to eq false
  end

  it 'should return false when given an incorrect user' do
    expect(User.check_password('wrong', 'wrong')).to eq false
  end

  it 'should return nil when given an incorrect user' do
    expect{User.set_user('testuser')}.to change{User.logged_in_name}.to('testuser')
  end

end
