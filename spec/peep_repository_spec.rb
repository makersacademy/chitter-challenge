require 'peep_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_users_table
  end

  it 'shows a list of all peeps' do
    repo = PeepRepository.new
    peeps = repo.all

    expect(peeps.length).to eq(4)
    expect(peeps.last.contents).to eq('User 3 newer post')
  end
end
