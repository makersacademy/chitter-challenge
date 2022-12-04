require 'peep'
require 'peep_repo'

def reset_peeps_table
	seed_sql = File.read('spec/peeps_seeds.sql')
	connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
	connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  it 'lists all peeps' do
    repo = PeepRepository.new

    peeps = repo.all
    
    expect(peeps.length).to eq(3)
    expect(peeps[0].username).to eq('user_01')
    expect(peeps[0].comment).to eq('Hello world')
    expect(peeps[0].time).to eq('2022-04-12 00:14:00')

		expect(peeps[1].username).to eq('user_01')
    expect(peeps[1].comment).to eq('This is awesome!')
    expect(peeps[1].time).to eq('2022-04-12 00:14:45')

		expect(peeps[2].username).to eq('user_01')
    expect(peeps[2].comment).to eq('Bored.')
    expect(peeps[2].time).to eq('2022-04-12 00:56:57')
  end


	it 'updates the table with a new peep' do
		repo = PeepRepository.new

		new_peep = Peep.new
		new_peep.username = 'user_01'
		new_peep.comment = 'Bye!'
		new_peep.time = '2022-04-12 01:18:38'

		repo.create(new_peep)

		all_peeps = repo.all

		expect(all_peeps).to include(have_attributes(username: new_peep.username, comment: new_peep.comment, time: new_peep.time,))
	end
end