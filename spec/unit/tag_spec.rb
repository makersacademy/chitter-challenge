require 'tag'
  
describe Tag do

  describe '.create' do
    it 'Creates a new tag' do
      tag = Tag.create(peep_fk: 3)
      expect(tag).to be_a Tag
    end
  end
end
