
describe '.add' do
  it 'creates a new peep' do
    peep = Peep.add(text: 'cos tam', user_id: 1)
    persisted_data = persisted_data(table: :peeps, id: peep.id)

    expect(peep).to be_a Peep
    expect(peep.text).to eq 'cos tam'
  end
end

describe '.all' do
  it 'shows all peeps' do
    Peep.add(text: 'cos tam', user_id: 1)
    Peep.add(text: 'tam cos', user_id: 1)

    expect(Peep.all(1)).to eq ["cos tam", "tam cos"]
  end
end
