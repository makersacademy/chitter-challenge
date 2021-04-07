describe '.all' do
  it 'returns a list of peeps' do
    PG.connect(dbname: 'peep_manager_test')

    Peep.create(peep: 'Salut!')
    Peep.create(peep: 'Ca farte?')

    peeps = Peep.all

    expect(peeps).to include "Salut!"
    expect(peeps).to include "Ca farte?"
  
  end

  it 'returns a list of reversed peeps' do
    PG.connect(dbname: 'peep_manager_test')

    Peep.create(peep: 'Salut!', created_at: '2021-01-31 10:42:42+00')
    Peep.create(peep: 'Ca farte?', created_at: '2021-01-31 10:43:42+00')

    peeps = Peep.all

    expect(peeps.length).to eq 2
    expect(peeps.first.peep).to eq 'Ca farte?'
    expect(peeps.last.peep).to eq 'Salut!'
    expect(peeps.first.created_at).to eq '2021-01-31 10:43:42+00'
    expect(peeps.last.created_at).to eq '2021-01-31 10:42:42+00'

  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: 'Kikoo!')

      expect(Peep.all.first).to eq 'Kikoo!'
    end
  end
end