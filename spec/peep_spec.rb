require 'peep'

describe Peep do
  let(:peep) { Peep.create(peep: 'This is a test peep!') }
  let(:another_peep) { Peep.create(peep: 'This is another test peep!') }

  describe '.all' do
    it 'retrieves all the peeps from the database' do
      peep
      another_peep
      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.peep).to eq 'This is a test peep!'
      expect(peeps.last.created_at).to eq peep.created_at
    end
  end

  describe '.create' do
    it 'creates and stores a peep in the database' do
      persisted_data = PG.connect(dbname: 'chitter-test')
                         .exec("SELECT * FROM peeps WHERE id = '#{peep.id}';")

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'This is a test peep!'
      expect(peep.created_at).to eq Time.parse(persisted_data.first['created_at'])
                                        .strftime("%B %e, %Y at %I:%M %p")
    end
  end
end
