require 'blab'

describe Blab do
  describe '.all' do
    it 'returns all the blabs' do
      user = User.create('The Testman', 'Testee McTest', 'test@testmail.com', 'p@$$w0rd')
      blabs = [
        Blab.create('test blab one', user.id),
        Blab.create('test blab two', user.id),
        Blab.create('test blab three', user.id)
      ]
      expect(Blab.all).to eq blabs
    end
  end

  describe '.create' do
    it 'creates a new blab' do
      user = User.create('The Testman', 'Testee McTest', 'test@testmail.com', 'p@$$w0rd')
      blab = Blab.create('test blab', user.id)
      expect(blab.id).not_to be_nil
    end
  end
end
