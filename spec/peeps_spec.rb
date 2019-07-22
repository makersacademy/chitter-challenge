require 'database_helpers'
require 'peeps'

describe '.all' do
  it 'returns a list of all peeps' do
    connection = PG.connect(dbname: 'chitter_peeps_test')
    peep = Peeps.create(peep: 'Today is Wednesday', time: Time.now)

    peeps = Peeps.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq 'Today is Wednesday'
  end
end

describe '.create' do
    it 'creates new peep' do
      peep = Peeps.create(peep: 'Test', time: Time.now)
      persisted_data = persisted_data(id: peep.id)
      expect(peep).to be_a Peeps
      expect(peep.id).to eq persisted_data['id']
      expect(peep.peep).to eq 'Test'
    end

    it "Shows time each peep was created" do
      Peeps.create(peep: 'Today is Sunday', time: Time.now)
      time = Time.now
      peeps = Peeps.all

      expect(peeps.first.time).to eq time.strftime("%e %b %Y %H:%M:%S%p")
    end

  end

describe '.delete' do
  it 'deletes the given peep' do
    peep = Peeps.create(peep: 'Today is Wednesday', time: Time.now)

    Peeps.delete(id: peep.id)

    expect(Peeps.all.length).to eq 0
  end
end
