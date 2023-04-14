require 'message'
require 'message_repository'

def reset_albums_table
  seed_sql = File.read('spec/seeds/Chitter.sql')
  connection = PG.connect({ host: 'localhost', dbname: database_name, user: 'postgres', password: ENV['DATABASE_PASSWORD']})
  # dbname: 'Chitter'
  connection.exec(seed_sql)
end

describe MessageRepository do
  it 'finds all messages' do
    repo = MessageRepository.new
    message = repo.all[0]

    expect(message.time).to include("12:09:00")
    expect(message.date).to include("2023-04-13")
    expect(message.content).to include("Hello, world")
  end

  it 'finds all messages and returns it in reverse chronological order' do
    repo = MessageRepository.new
    message = repo.all[0]

    expect(message.time).to include("12:09:00", "10:15:00")
    expect(message.date).to include("2023-04-13", "2023-04-09")
    expect(message.content).to include("Hello, world", "Ruby rules")
  end
end