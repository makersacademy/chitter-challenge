require_relative '../lib/peep'
require_relative '../lib/peep_repository'

describe PeepRepository do

  before(:all) do
    @repo = PeepRepository.new
  end
  
  it 'finds all peeps' do

    peeps = @repo.all

    expect(peeps.length).to eq 6
    expect(peeps.first.id).to eq 1
    expect(peeps.first.content).to eq 'First Peep'
    
  end

  it 'finds one peep' do
    
    peep = @repo.find(1)
    
    expect(peep.id).to eq(1)
    expect(peep.content).to eq('First Peep')
    expect(peep.maker_id).to eq(1)
  end

  it 'creates one peep' do
    peep = Peep.new
    peep.content = '1'
    peep.conversation_id = 1
    peep.maker_id = 1
    @repo.create(peep)

    peeps = @repo.all

    expect(peeps.last.content).to eq '1'
    expect(peeps.last.conversation_id).to eq 1
    expect(peeps.last.maker_id).to eq 1

  end

  it 'deletes one peep' do
    @repo.delete(1)
    peeps = @repo.all
    expect(peeps.length).to eq 5
  end
end