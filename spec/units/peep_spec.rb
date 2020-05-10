require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      date_and_time = Time.new
      test = Peep.add(text: "Feeling those summer vibes today")
      Peep.add(text: "Got the frisbee out for the first time in months!")
      Peep.add(text: "Damn, it''s suncream o''clock!")

      # connection.exec("INSERT INTO peeps (text) VALUES ('Feeling those summer vibes today');")
      # connection.exec("INSERT INTO peeps (text) VALUES ('Got the frisbee out for the first time in months!');")
      # connection.exec("INSERT INTO peeps (text) VALUES ('Damn, it''s suncream o''clock!');")

      peep = Peep.all

      expect(peep.length).to eq 3
      expect(peep.first).to be_a Peep
      expect(peep.first.id).to eq test.id
      expect(peep.first.text).to eq 'Feeling those summer vibes today'
      expect(peep.first.date_and_time).to eq "#{date_and_time}"

      # expect(peep).to include "Feeling those summer vibes today"
      # expect(peep).to include "Got the frisbee out for the first time in months!"
      # expect(peep).to include "Damn, it's suncream o'clock!"

    end
  end

  describe '.add' do
    it 'adds user entries to the database' do
      date_and_time = Time.new
      first_peep = Peep.add(text: 'Hello guys!')
      second_peep = Peep.add(text: 'Chitter > Twitter')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{first_peep.id}")

      # peep = Peep.all
      expect(first_peep).to be_a Peep
      expect(first_peep.id).to eq persisted_data.first['id']
      expect(first_peep.text).to eq 'Hello guys!'
      expect(second_peep.text).to eq 'Chitter > Twitter'
      expect(first_peep.date_and_time).to eq "#{date_and_time}"

    end

    it 'adds time of post to the database' do
      peep = Peep.add(text: 'Hello guys!')

      date_and_time = Time.new

      expect(peep.text).to eq 'Hello guys!'
      expect(peep.date_and_time). to eq "#{date_and_time}"

    end
  end
end
