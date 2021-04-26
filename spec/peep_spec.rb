require 'peep'

describe Peep do

  context '#create' do
    it 'creates new peeps' do
      action_of_peeping = Peep.create(peep: 'Loving life #brunch')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{action_of_peeping.id};")

      expect(action_of_peeping).to be_a Peep
      expect(action_of_peeping.id).to eq persisted_data.first['id']
      expect(action_of_peeping.peep).to eq 'Loving life #brunch'
    end
  end

  context '#all' do
    it 'returns all peeps' do
      action_of_peeping = Peep.create(peep: "Its only monday and I ate chocolate #everyweekdayisacheatday")
      Peep.create(peep: "Just another Monday peep")

      feed = Peep.all

      expect(feed.first).to be_a Peep
      expect(feed.length).to eq 2
      expect(feed.first.id).to eq action_of_peeping.id
      expect(feed.first.peep).to eq "Its only monday and I ate chocolate #everyweekdayisacheatday"
    end
  end
  context '#time' do
    it 'returns all peeps' do
      action_of_peeping = Peep.create(peep: 'Early mornings #healthylifestyle')

      expect(action_of_peeping.time).to eq "#{Time.now.strftime("%I:%M")}"
    end
  end
end
