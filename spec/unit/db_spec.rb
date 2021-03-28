require 'db'

describe DB do
  describe '.setup' do
    it 'calls pg connect' do
      expect(PG).to receive(:connect).with(dbname: 'test')
      DB.setup('test')
    end
  end

  it 'connection persists' do
    conn = DB.setup('chitter_test')
    expect(DB.connection).to eq conn
  end

  describe '.query' do
    it 'execute query passed in' do
      conn = DB.setup('chitter_test')
      p "DB.connection: #{conn}"
      expect(DB.query('SELECT * FROM users;').class).to eq PG::Result
    end
  end
end
