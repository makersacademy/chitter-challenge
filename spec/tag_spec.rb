require 'tag'

describe Tag do
  describe '.add_tag' do
    it 'responds to add_tag' do
      expect(Tag).to respond_to(:add_tag)
    end
  end
end
