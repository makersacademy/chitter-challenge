describe Peep do
  describe '.all' do
    it 'shows all peeps' do
      con = PG.connect(dbname: 'chitter_test')

      con.exec("INSERT INTO posts VALUES(1, 'This is my first peep.');")
      con.exec("INSERT INTO posts VALUES(2, 'This is my second peep.');")
      con.exec("INSERT INTO posts VALUES(3, 'This is my third peep.');")

      expected_posts = [
        'This is my first peep.',
        'This is my second peep.',
        'This is my third peep.'
      ]

      expect(Peep.all).to eq expected_posts
    end
  end
end
