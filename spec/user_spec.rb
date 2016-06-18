require 'Bcrypt'

describe User do

  describe '#validate' do
    it 'confirms a password is correct' do
      sign_up
      expect(User.validate('John_Doe', 'secret')).to eq true
    end
  end

end
