require 'peep'

RSpec.describe Peep do
  it 'tags is nil until content defined' do
    peep = Peep.new
    expect(peep.tags).to eq nil
  end

  it 'returns empty tags array when content contains no @' do
    peep = Peep.new
    peep.content = 'No tags here'
    
    expect(peep.tags).to eq []
  end

  it 'returns tagged usernames' do
    peep = Peep.new
    peep.content = '@jamie is cool'
    
    expect(peep.tags).to eq ['@jamie']
  end

  it 'returns tagged usernames without duplicates' do
    peep = Peep.new
    peep.content = '@jamie is cool but @stephen is cooler @ than @jamie'
    
    expect(peep.tags).to eq ['@jamie', '@stephen']
  end
end