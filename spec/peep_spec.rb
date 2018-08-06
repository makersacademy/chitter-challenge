require 'peep'

describe Peep do
  describe '.post' do
    it "posts a peep" do
      name = "luke"
      username = "skywalker"
      peep = "This is great fun!"
      subject.post(name, username, peep)
    end
  end

  describe '.view_peeps' do
    it 'shows all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (name, username, peep) VALUES ('darth', 'sith', 'join the dark side');")
      expect(peeps.view_peeps).to include 'join the dark side'
    end
  end

end
