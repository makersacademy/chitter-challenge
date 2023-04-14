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

    expect(message.time).to eq("12:09:00")
    expect(message.date).to eq("2023-04-13")
    expect(message.content).to eq("Hello, world")
  end
end