require_relative '../lib/tag'
require_relative '../lib/tag_repository'

describe TagRepository do

  before(:all) do
    @repo = TagRepository.new
  end
  
  it 'finds all tags' do

    tags = @repo.all

    expect(tags.length).to eq 3
    expect(tags.first.maker_id).to eq 1
    expect(tags.first.peep_id).to eq 4
    
  end

  it 'creates one tag' do
    tag = Tag.new
    tag.maker_id = 1
    tag.peep_id = 1
    @repo.create(tag)

    tags = @repo.all

    expect(tags.last.maker_id).to eq 1
    expect(tags.last.peep_id).to eq 1

  end

  it 'deletes one tag' do
    @repo.delete(@repo.all.first)
    tags = @repo.all
    expect(tags.length).to eq 2
  end
end