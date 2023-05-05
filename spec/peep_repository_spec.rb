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
    it "returns a list of all peeps" do
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
  end
end