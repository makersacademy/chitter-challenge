require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds_chitter_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_peeps_table
  end

  it 'finds all peeps that are not replies and their author' do
    repo = PeepRepository.new

    peeps = repo.all_with_user

    expect(peeps.length).to eq 3
    expect(peeps.first.id).to eq 1
    expect(peeps.first.message).to eq "Hello world"
    expect(peeps.first.timestamp).to eq "2023-04-28 12:45:05"
    expect(peeps.first.user.name).to eq "Bob"
    expect(peeps.first.user.username).to eq "bob678"
  end
end
