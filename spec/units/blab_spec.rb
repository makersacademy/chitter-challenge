require 'blab'

describe Blab do
  describe '.all' do
    it 'returns all the blabs' do
      user = create_new_user
      blabs = [
        Blab.create('test blab one', user.id),
        Blab.create('test blab two', user.id),
        Blab.create('test blab three', user.id)
      ]
      blab_ids = return_ids(Blab.all)
      test_blab_ids = return_ids(blabs)

      expect(blab_ids).to eq test_blab_ids
    end
  end

  describe '.create' do
    it 'creates a new blab' do
      user = create_new_user
      blab = Blab.create('test blab', user.id)

      expect(blab.id).not_to be_nil
    end
  end
end
