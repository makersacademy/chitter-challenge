require 'pg'

describe '.all' do
  it 'displays all website peeps' do
    connection = PG.connect(dbname: 'chitter_challenge')
    result = connection.exec('SELECT * FROM peeps')
    result.each { |peep| p peep }
    expect(result).to eq result
  end

  #create
end