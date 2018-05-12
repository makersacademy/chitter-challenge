require 'user'

describe User do
  describe '#initalize' do
    subject(:user) { User.new('Beyonce Knowles', 'Yoncé', 'queenb@gmail.com', 'lemonade')}
    it 'should respond to name with the name argument' do
      expect(user.name).to eq('Beyonce Knowles')
    end
    it 'should respond to username with the name argument' do
      expect(user.username).to eq('Yoncé')
    end
    it 'should respond to email with the email argument' do
      expect(user.email).to eq('queenb@gmail.com')
    end
    it 'should respond to password with the email argument' do
      expect(user.password).to eq('lemonade')
    end
  end
end
