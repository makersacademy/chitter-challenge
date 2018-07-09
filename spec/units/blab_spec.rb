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
      blab_ids = Blab.all.map do |blab|
        blab.id
      end
      test_blab_ids = blabs.map do |blab|
        blab.id
      end

      expect(blab_ids).to eq test_blab_ids
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
