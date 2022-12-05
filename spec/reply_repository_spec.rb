require 'reply'
require 'reply_repository'

def reset_replies_table
  seed_sql = File.read('spec/seeds/chitter_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe ReplyRepository do
  before(:each) do
    reset_replies_table
  end

  it 'finds all replies' do
    repo = ReplyRepository.new

    replies = repo.all

    expect(replies.length).to eq(2)
    expect(replies.first.username).to eq('JCMorgan')
    expect(replies.first.content).to eq('Hi')
    expect(replies.first.datetime).to eq('2022-12-04 13:02:47')
    expect(replies.first.peep_id).to eq('2')

    expect(replies.last.username).to eq('CoolCat23')
    expect(replies.last.content).to eq(':D')
    expect(replies.last.datetime).to eq('2022-12-04 13:04:05')
    expect(replies.last.peep_id).to eq('2')
  end

  it 'finds replies for a peep' do
    repo = ReplyRepository.new

    replies = repo.ids(2)

    expect(replies.length).to eq(2)
    expect(replies.first.username).to eq('JCMorgan')
    expect(replies.first.content).to eq('Hi')
    expect(replies.first.datetime).to eq('2022-12-04 13:02:47')
    expect(replies.first.peep_id).to eq('2')

    expect(replies.last.username).to eq('CoolCat23')
    expect(replies.last.content).to eq(':D')
    expect(replies.last.datetime).to eq('2022-12-04 13:04:05')
    expect(replies.last.peep_id).to eq('2')
  end

  it 'creates a reply' do
    repo = ReplyRepository.new

    new_reply = Reply.new
    new_reply.username = 'CoolCat23'
    new_reply.content = 'cool!'
    new_reply.datetime = '2022-12-05 17:11:26'
    new_reply.peep_id = '1'

    repo.create(new_reply)

    replies = repo.all

    expect(replies.length).to eq(3)
    expect(replies.last.username).to eq('CoolCat23')
    expect(replies.last.content).to eq('cool!')
    expect(replies.last.datetime).to eq('2022-12-05 17:11:26')
    expect(replies.last.peep_id).to eq('1')
  end

  it 'finds list of peep_ids' do
    repo = ReplyRepository.new

    ids = repo.find_ids

    expect(ids.length).to eq(2)
    expect(ids).to eq [2,2]

  end

end
