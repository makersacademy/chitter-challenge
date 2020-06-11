require 'peep'

describe Peep do
  describe '.all' do
    it 'shows list of peeps' do
      # add test data
      Peep.create(content: 'I need a holiday')
      Peep.create(content: 'look at my cat')
      newest_peep = Peep.create(content: 'HUNGRY')
      timestamp = Time.now
      timestamp_format = timestamp.strftime('%b %e %I:%M%P')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first.content).to eq 'HUNGRY'
      expect(peeps.first.id).to eq newest_peep.id
      expect(peeps.first.time).to eq timestamp_format

    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(content: 'Meow')

      test_peep = Peep.all.first

      expect(test_peep.content).to eq 'Meow'
    end
  end

end
