require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (text) VALUES ('Feeling those summer vibes today');")
      connection.exec("INSERT INTO peeps (text) VALUES ('Got the frisbee out for the first time in months!');")
      connection.exec("INSERT INTO peeps (text) VALUES ('Damn, it''s suncream o''clock!');")

      peep = Peep.all

      expect(peep).to include "Feeling those summer vibes today"
      expect(peep).to include "Got the frisbee out for the first time in months!"
      expect(peep).to include "Damn, it's suncream o'clock!"

    end
  end
end
