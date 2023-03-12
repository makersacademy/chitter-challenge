require 'maker_repository'
require 'maker'

def reset_makers_table
  seed_sql = File.read('spec/seeds/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_db_test' })
  connection.exec(seed_sql)
end

describe MakerRepository do
  before(:each) do
    reset_makers_table
  end

  it 'creates a maker' do
    repo = MakerRepository.new

    new_maker = Maker.new
    new_maker.email = 'maker3@mail.com'
    new_maker.password = '12345678'
    new_maker.name = 'maker3'
    new_maker.username = 'username3'

    repo.create(new_maker)
    
    expect(new_maker.email).to eq('maker3@mail.com')
    expect(new_maker.password).to eq('12345678')
    expect(new_maker.name).to eq('maker3')
    expect(new_maker.username).to eq('username3')
  end

  it 'finds a single maker' do
    repo = MakerRepository.new

    maker = repo.find(1)

    expect(maker.id).to eq(1)
    expect(maker.email).to eq('maker1@mail.com')
    expect(maker.password).to eq('12345678')
    expect(maker.name).to eq('maker1')
    expect(maker.username).to eq('username1')
  end


end