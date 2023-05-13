require 'tag'

RSpec.describe Tag do
  it 'is valid with valid attributes' do
    tag = Tag.new(content: 'a tag')
    expect(tag.valid?).to eq true
  end

  it 'is invalid if content is blank' do
    tag = Tag.new(content: '')
    expect(tag.valid?).to eq false
  end
end
