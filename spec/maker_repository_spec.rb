require_relative '../lib/maker'
require_relative '../lib/maker_repository'

describe MakerRepository do

  before(:all) do
    @repo = MakerRepository.new
  end
  
  it 'finds all makers' do

    makers = @repo.all

    expect(makers.length).to eq 5
    expect(makers.first.id).to eq 1
    expect(makers.first.email).to eq 'ad@host.com'
    expect(makers.first.password).to eq 'password1'
    expect(makers.first.name).to eq 'Adam'
    expect(makers.first.username).to eq 'Ad'
    
  end

  it 'creates one maker' do
    maker = Maker.new
    maker.email = 'funny@host.com'
    maker.password = 'password6'
    maker.name = 'Freddy'
    maker.username = 'funtime'
    @repo.create(maker)

    makers = @repo.all

    expect(makers.last.id).to eq 6
    expect(makers.last.email).to eq 'funny@host.com'
    expect(makers.last.password).to eq 'password6'
    expect(makers.last.name).to eq 'Freddy'
    expect(makers.last.username).to eq 'funtime'

  end

  it 'finds one maker via id' do
    
    maker = @repo.find(1)
    
    expect(maker.id).to eq(1)
    expect(maker.name).to eq ('Adam')
  end

  it 'deletes one maker via id' do
    @repo.delete(1)
    makers = @repo.all
    expect(makers.length).to eq 4
  end
end