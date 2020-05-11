describe Peep do

  it 'returns its id, time and date' do
    peep = Peep.new(id: 1, body: "Today was a good day", created_at: '2020-10-24 11:11:11')
    expect(peep.id).to eq(1)
    expect(peep.body).to eq("Today was a good day")
    expect(peep.created_at).to eq('2020-10-24 11:11:11')
  end

  it 'adds a new peep to the database' do
    @time = '2020-10-24 11:11:11' 
    allow(Time).to receive(:now).and_return(@time)
    Peep.add(body: 'Today was a good day')
    expect(Peep.all[0].body).to eq('Today was a good day')
    expect(Peep.all[0].created_at).to eq('2020-10-24 11:11:11')
  end
end
