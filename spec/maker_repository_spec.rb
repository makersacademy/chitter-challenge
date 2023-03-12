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
    new_maker.email = 'maker2@mail.com'
    new_maker.password = '12345678'
    new_maker.name = 'maker2'
    new_maker.username = 'username2'

    expect(makers.last.email).to eq('maker2@mail.com')
    expect(new_maker.password).to eq('12345678')
    expect(new_maker.name).to eq('maker2')
    expect(new_maker.username).to eq('username2')
  end



end