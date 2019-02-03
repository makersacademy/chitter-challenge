require 'bcrypt'

RSpec.describe Password do

  it 'should return true when given a correct user/pass' do
    expect(described_class.check_password('al123', 'password123')).to eq true
  end

  it 'should return false when given a correct user/incorrect pass' do
    expect(described_class.check_password('al123', 'wrong')).to eq false
  end

  it 'should return false when given an incorrect user' do
    expect(described_class.check_password('wrong', 'wrong')).to eq false
  end

end
