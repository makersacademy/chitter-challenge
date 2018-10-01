describe Peeps do
  let(:database) { DBHelper.connect_to_db }
  describe '.all' do
    it 'returns array of all tweets' do
      time = Time.now
      msg = 'Hello Chitter!'
      database.exec("INSERT INTO peeps(created_at, message) VALUES('#{time}', '#{msg}')")
      # format time to be the same as the db returns
      expect(Peeps.all).to eq([{msg: msg, created_at: time.strftime('%I:%M %p - %d %b %Y')}])
    end
  end

  describe '.add' do
    it 'adds a peep to the DB' do
      Peeps.add('Hello Chitter!')
      expect(database.exec('SELECT message FROM peeps').first).to eq({"message" => "Hello Chitter!"})
    end
  end
end