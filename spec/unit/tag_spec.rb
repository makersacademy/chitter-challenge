require 'tag'
  
describe Tag do

  describe '.create' do
    it 'Creates a new tag' do
      tag = Tag.create(content: 'testing_tag')

      expect(tag.content).to eq 'testing_tag'
    end
  end
end
