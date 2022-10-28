

describe MessageRepository do
  
    # 1
  it 'gets all messages' do

    repo = MessageRepository.new

    messages = repo.all

    expect(messages.length).to eq 2

    expect(messages[0].id).to eq '1'
    expect(messages[0].content).to eq 'My first Peep'
    expect(messages[0].time_date).to eq '2022-10-26T13:42:38+01:00'
    expect(messages[0].user_id).to eq '1'

    expect(messages[1].id).to eq '2'
    expect(messages[1].content).to eq 'This is MY first Peep'
    expect(messages[1].time_date).to eq '2022-10-26T14:04:57+01:00'
    expect(messages[1].user_id).to eq '2'
  end

    # 2
  it 'gets a single message' do

    repo = MessageRepository.new

    message = repo.find(1)

    expect(message.id).to eq '1'
    expect(message.content).to eq 'My first Peep'
    expect(message.time_date).to eq '2022-10-26T13:42:38+01:00'
    expect(message.user_id).to eq '1'
  end

    # 3
  it 'creates a message' do

    repo = MessageRepository.new

    message = Message.new
    message.content = 'Testing a Peep'
    message.time_date = '2022-10-26T17:12:06+01:00'
    message.user_id = 1

    repo.create(message)

    messages = repo.all

    expect(messages.last.id).to eq '3'
    expect(messages.last.content).to eq 'Testing a Peep'
    expect(messages.last.time_date).to eq '2022-10-26T17:12:06+01:00'
    expect(messages.last.user_id).to eq '1'
  end
end
