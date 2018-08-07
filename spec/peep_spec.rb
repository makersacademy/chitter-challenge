require 'peep'

describe Peep do

  describe '.post' do
    it "posts a peep" do
      # name = "luke"
      # username = "skywalker"
      # peep = "This is great fun!"
      # Peep.post('#{name}', '#{username}', '#{peep}')
      Peep.post('luke', 'skywalker', 'This is great fun!')
      expect(Peep.view_peeps).to include 'This is great fun!'
    end
  end

  describe '.view_peeps' do
    it 'shows all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (name, username, peep) VALUES ('darth', 'sith', 'join the dark side');")
      expect(Peep.view_peeps).to include 'join the dark side'
    end
  end

end
