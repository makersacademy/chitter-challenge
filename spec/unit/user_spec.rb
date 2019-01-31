RSpec.describe User do

  it 'should return true when given a correct user/pass' do
    expect(User.check_password('al123', 'password123')).to eq true
  end

  it 'should return nil when given a correct user/incorrect pass' do
    expect(User.check_password('al123', 'wrong')).to eq nil
  end

  it 'should return nil when given an incorrect user' do
    expect(User.check_password('wrong', 'wrong')).to eq nil
  end

end
