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
    expect(BCrypt::Password.new(makers.last.password)).to eq 'password6'
    expect(makers.last.name).to eq 'Freddy'
    expect(makers.last.username).to eq 'funtime'

  end

  it 'finds one maker via id' do
    
    maker = @repo.find(1)
    
    expect(maker.id).to eq(1)
    expect(maker.name).to eq ('Adam')
  end

  it 'finds one maker via email' do
    
    maker = @repo.find_by_email('ad@host.com')
    
    expect(maker.id).to eq(1)
    expect(maker.name).to eq ('Adam')
  end

  it 'deletes one maker via id' do
    @repo.delete(1)
    makers = @repo.all
    expect(makers.length).to eq 4
  end

  describe '#login' do
    context 'valid details' do
      it 'returns the correct details' do
        maker = Maker.new
        maker.email = 'gunny@host.com'
        maker.password = 'password7'
        maker.name = 'Freddy'
        maker.username = 'guntime'
        @repo.create(maker)
        expect(@repo.login('gunny@host.com','password7')).not_to eq nil
      end
    end
    context 'invalid details' do
      it 'returns nil' do
        expect(@repo.login('ad@most.com','password1')).to eq nil
      end
    end
  end

  describe '#register' do
    context 'all valid details' do
      xit 'saves the details and logs in' do
        
      end
    end

    context 'missing or invalid details' do
      xit 'fails' do
        
      end
    end 
  end
end