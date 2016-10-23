require './app/models/user'

describe User do

  let(:bcrypt_class_double) {double(:bcrypt, new: bcrypt_class)}
  let(:bcrypt_class) {double(:bcrypt_class, :== => true )}

  describe '#authenticate' do
    before do
      User.create(name: 'tom',
      username: 't',
      email: 't@t.com',
      password: '123',
      password_confirmation: '123')
    end

    it 'sends authenticate request to encryption class' do
      expect(described_class.authenticate('t@t.com', 'test_password', bcrypt_class_double)).not_to be_nil
      expect(bcrypt_class).to have_received(:==).with('test_password')
    end
    it 'returns user instance if passwords match' do
      expect(described_class.authenticate('t@t.com', 'test_password', bcrypt_class_double)).to be_an_instance_of(described_class)
    end
    it 'returns nil instance if passwords do not match' do
      allow(bcrypt_class).to receive(:==).and_return(false)
      expect(described_class.authenticate('t@t.com', 'test_password', bcrypt_class_double)).to be_nil
    end
  end

end
