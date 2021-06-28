require 'chitter'
require 'database_helpers'

describe Chitter do
  # before(:each) do
  #   @connection = PG.connect(dbname: 'chitter_peeps_test')
  #   @connection.exec('TRUNCATE TABLE news_feed;')
  # end

  it 'sends a peep to the database' do
    peep = Chitter.create(name: 'John', message: 'Hello World', time: "#{Time.new}")
    persisted_data = persisted_data(id: peep.id)

    expect(peep.message).to eq 'Hello World'
  end
end

