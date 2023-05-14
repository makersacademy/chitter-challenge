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

  context '#all_with_user' do
    it 'finds all peeps that are not replies and their author' do
      repo = PeepRepository.new

      peeps = repo.all_with_user
      expect(peeps.length).to eq 3
      expect(peeps.first.id).to eq 2
      expect(peeps.first.message).to eq 'This is a great peep'
      expect(peeps.first.timestamp).to eq '03 May 2023 16:23:34'
      expect(peeps.first.user.name).to eq 'Fred'
      expect(peeps.first.user.username).to eq 'freddo'
    end

    it 'returns the correct reply count for each peep' do
      repo = PeepRepository.new

      peeps = repo.all_with_user
      expect(peeps.first.reply_count).to eq 1
      expect(peeps.last.reply_count).to eq 0
    end

    it 'returns a list of tags for each peep' do
      repo = PeepRepository.new

      peeps = repo.all_with_user
      expect(peeps.first.tags).to eq []
      expect(peeps[1].tags.length).to eq 1
      expect(peeps[1].tags.first.username).to eq 'bob678'
    end

    it 'orders the result set in reverse chronological order' do
      repo = PeepRepository.new

      peeps = repo.all_with_user
      expect(peeps.last.id).to eq 1
      expect(peeps.last.message).to eq 'Hello world'
      expect(peeps.last.timestamp).to eq '28 Apr 2023 12:45:05'
    end
  end

  context '#create' do
    it 'creates a new peep' do
      repo = PeepRepository.new
      peep = Peep.new
      peep.message = 'This is a new peep'
      peep.user_id = 1

      repo.create(peep)
      expect(repo.all_with_user.length).to eq 4
      expect(repo.all_with_user.first.message).to eq 'This is a new peep'
      expect(repo.all_with_user.first.user.name).to eq 'Bob'
    end

    it 'creates a reply' do
      repo = PeepRepository.new
      peep = Peep.new
      peep.message = 'This is a new peep'
      peep.user_id = 1
      peep.peep_id = 2

      repo.create(peep)
      expect(repo.all_with_user.first.reply_count).to eq 2
    end
  end
  
  context '#find_by_id' do
    it 'finds a single peep' do
      repo = PeepRepository.new

      peep = repo.find_by_id(4)
      expect(peep.message).to eq 'I am tagging Bob'
      expect(peep.timestamp).to eq '01 May 2023 16:23:35'
      expect(peep.user.name).to eq 'Fred'
      expect(peep.user.username).to eq 'freddo'
      expect(peep.tags.length).to eq 1
      expect(peep.tags.first.username).to eq 'bob678'
    end
  end

  context '#get_replies' do
    it 'gets a list of replies for a peep' do
      repo = PeepRepository.new
      replies = repo.get_replies(2)

      expect(replies.length).to eq 1
      expect(replies.first.message).to eq 'This is a reply to the great peep'
      expect(replies.first.user.name).to eq 'Bob'
      expect(replies.first.user.username).to eq 'bob678'
    end
  end
end
