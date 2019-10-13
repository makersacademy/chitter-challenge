require 'peep'

describe Peep do
  describe '.all' do
      it 'returns a list of peeps' do
        connection = PG.connect(dbname: 'chitter_test')

        peep = Peep.create(text: 'Hello!', time: Time.new.strftime("%m/%d/%Y %I:%M %p"))
        Peep.create(text: 'Hello again!', time: Time.new.strftime("%m/%d/%Y %I:%M %p"))
     
        peeps = Peep.all
     
        expect(peeps.first).to be_a Peep
        expect(peeps.first.text).to eq 'Hello!'
        expect(peeps.first.time).to eq Time.new.strftime("%m/%d/%Y %I:%M %p")
       end
     end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(text: "This is a new peep!", time: Time.new.strftime("%m/%d/%Y %I:%M %p"))
      persisted_data = persisted_data(id: peep.id, table: 'peeps')
      expect(peep.text).to eq "This is a new peep!"
      expect(peep.id).to eq persisted_data.first['id'] 
      expect(peep.time).to eq Time.new.strftime("%m/%d/%Y %I:%M %p")
    end
  end 
end
