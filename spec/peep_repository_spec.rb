require 'peep_repository'

def reset_peeps_table
  sql_seeds = File.read('spec/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(sql_seeds)
end

describe PeepRepository do
  before(:each) do
    reset_peeps_table
  end

  describe '#all' do
    it 'returns a list of all peeps' do
      repo = PeepRepository.new
      peeps = repo.all

      expect(peeps.length).to eq 7

      expect(peeps).to include(
        have_attributes(
          id: 1,
          content: 'content_1',
          time_posted: Time.new('2023-05-01 17:15:32'),
          user_id: 1
        )
      )

      expect(peeps).to include(
        have_attributes(
          id: 5,
          content: 'content_5',
          time_posted: Time.new('1999-04-19 16:59:59'),
          user_id: 1
        )
      )
    end

    describe '#find' do
      it 'returns a peep by id' do
        repo = PeepRepository.new
        peep = repo.find(1)

        expect(peep.id).to eq 1
        expect(peep.content).to eq  'content_1'
        expect(peep.time_posted).to eq Time.new('2023-05-01 17:15:32')
        expect(peep.user_id).to eq 1
      end

      it 'returns another peep by id' do
        repo = PeepRepository.new
        peep = repo.find(4)

        expect(peep.id).to eq 4
        expect(peep.content).to eq  'content_4'
        expect(peep.time_posted).to eq Time.new('2022-06-21 22:01:02')
        expect(peep.user_id).to eq 4
      end
    end

    describe '#create' do
      it 'adds a new peep to the database' do
        peep = Peep.new
        peep.content = 'new_content'
        peep.time_posted = Time.new('2023-05-05 17:53:00')
        peep.user_id = 3

        repo = PeepRepository.new
        repo.create(peep)

        expect(repo.all).to include(
          have_attributes(
            id: 8,
            content: 'new_content',
            time_posted: Time.new('2023-05-05 17:53:00'),
            user_id: 3
          )
        )
      end
    end
  end
end
