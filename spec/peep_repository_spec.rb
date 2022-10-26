require 'peep_repository'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_development' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_tables
  end

  describe '#peep_from_record' do
    it 'creates a Peep object from a SQL query record' do
      record = {
        'id' => '123',
        'content' => 'peep content',
        'creation_time' => '2022-10-12 17:00:00',
        'link_to' => nil,
        'user_id' => '3'
      }
      repo = PeepRepository.new
      peep = repo.peep_from_record(record)

      expect(peep.id).to eq 123
      expect(peep.content).to eq 'peep content'
      expect(peep.creation_time).to eq '2022-10-12 17:00:00'
      expect(peep.link_to).to eq 0
      expect(peep.user_id).to eq 3
    end
  end

  describe '#all' do
    it 'returns all peeps as an array of Peep objects' do
      repo = PeepRepository.new

      peeps = repo.all

      expect(peeps.length).to eq 6
      expect(peeps.first.id).to eq 1
      expect(peeps.first.content).to eq 'content peep 1'
      expect(peeps.first.creation_time).to eq '2022-10-24 10:30:21'
      expect(peeps.first.link_to).to eq 0
      expect(peeps.first.user_id).to eq 1
      expect(peeps.last.id).to eq 6
      expect(peeps.last.content).to eq 'content peep 6'
      expect(peeps.last.creation_time).to eq '2022-10-24 10:35:00'
      expect(peeps.last.link_to).to eq 1
      expect(peeps.last.user_id).to eq 3
    end
  end

  describe '#all_reverse_chron' do
    it 'returns all peeps as an array of Peep objects sorted by creation time in reverse chronological order' do
      repo = PeepRepository.new

      peeps = repo.all_reverse_chron

      expect(peeps.length).to eq 6
      expect(peeps.last.id).to eq 1
      expect(peeps.last.content).to eq 'content peep 1'
      expect(peeps.last.creation_time).to eq '2022-10-24 10:30:21'
      expect(peeps.last.link_to).to eq 0
      expect(peeps.last.user_id).to eq 1
      expect(peeps.first.id).to eq 6
      expect(peeps.first.content).to eq 'content peep 6'
      expect(peeps.first.creation_time).to eq '2022-10-24 10:35:00'
      expect(peeps.first.link_to).to eq 1
      expect(peeps.first.user_id).to eq 3
    end
  end

  describe '#find_by_id' do
    it 'returns a Peep object given an ID' do
      repo = PeepRepository.new

      peep_id = 2
      peep = repo.find_by_id(peep_id)

      expect(peep.id).to eq 2
      expect(peep.content).to eq 'content peep 2'
      expect(peep.creation_time).to eq '2022-10-24 10:31:00'
      expect(peep.link_to).to eq 0
      expect(peep.user_id).to eq 2
    end

    it 'returns nil if there is not match' do
      repo = PeepRepository.new

      user_id = 90
      expect(repo.find_by_user(user_id)).to eq nil
    end
  end

  describe '#find_by_user' do
    it 'returns all Peep objects given a user ID' do
      repo = PeepRepository.new

      user_id = 2
      peeps = repo.find_by_user(user_id)

      expect(peeps.length).to eq 2
      expect(peeps.first.id).to eq 2
      expect(peeps.first.content).to eq 'content peep 2'
      expect(peeps.first.creation_time).to eq '2022-10-24 10:31:00'
      expect(peeps.first.link_to).to eq 0
      expect(peeps.first.user_id).to eq 2
      expect(peeps.last.id).to eq 5
      expect(peeps.last.content).to eq 'content peep 5'
      expect(peeps.last.creation_time).to eq '2022-10-24 10:34:00'
      expect(peeps.last.link_to).to eq 1
      expect(peeps.last.user_id).to eq 2
    end

    it 'returns nil if there is not match' do
      repo = PeepRepository.new

      user_id = 90
      expect(repo.find_by_user(user_id)).to eq nil
    end
  end

  describe '#create' do
    it 'creates a new peep record given a Peep object' do
      repo = PeepRepository.new
      number_of_peeps = repo.all.length

      time = Time.now.getutc
      peep = Peep.new
      peep.content = 'new content!'
      peep.creation_time = time
      peep.link_to = 2
      peep.user_id = 2

      repo.create(peep)

      updated_number_of_peeps = repo.all.length

      expect(updated_number_of_peeps).to eq(number_of_peeps + 1)
      expect(repo.all).to include(
        have_attributes(
          content: 'new content!',
          creation_time: time.strftime('%Y-%m-%d %H:%M:%S'),
          link_to: 2,
          user_id: 2
        )
      )
    end
  end

  describe '#find_thread' do
    it 'return an array of linked peeps in chronological order' do
      repo = PeepRepository.new

      id_to_find = 1

      thread = repo.find_thread(1)

      expect(thread.length).to eq 3
      expect(thread.first.id).to eq 1
      expect(thread.first.content).to eq 'content peep 1'
      expect(thread.last.id).to eq 6
      expect(thread.last.content).to eq 'content peep 6'
    end
  end
end
