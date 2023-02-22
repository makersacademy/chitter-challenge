require 'message_repository'
require 'timecop'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe MessageRepository do
  before(:each) do 
    reset_tables
  end

  it 'shows all messages in reverse chronological order' do 

    repo = MessageRepository.new
    timeline = repo.display
    
    expect(timeline.length).to eq 3

    expect(timeline[0].content).to eq 'This is a short post'
    expect(timeline[0].id).to eq '2'
    expect(timeline[0].time_posted).to eq '2022-12-01 19:10:25'
    expect(timeline[0].user_id).to eq '1'

    expect(timeline[1].content).to eq 'Here is a slightly longer peep that I have created'
    expect(timeline[1].time_posted).to eq '2022-11-01 14:50:00'
    expect(timeline[1].user_id).to eq '2'
  
  end 

  before do
    Timecop.freeze('2022-05-01 12:37:42')
  end

  it 'creates a new message' do

    

    repo = MessageRepository.new
    message = Message.new

    message.content = 'This new post should have an older date to test sorting'
    # message.time_posted =  '2022-05-01 12:37:42'
    message.user_id = '2'

    repo.create(message)

    sort_messages = repo.sort_messages
    timeline = repo.display

    expect(timeline.last.content).to eq 'This new post should have an older date to test sorting'
    expect(timeline.last.time_posted).to eq '2022-05-01 12:37:42'
    expect(timeline.last.user_id).to eq '2'

  end 

end
