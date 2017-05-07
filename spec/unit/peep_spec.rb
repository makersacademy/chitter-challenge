describe Peep do
  it 'can create a peep' do
    peep = Peep.create(post: 'ahmed is a great person', time: '22:47')
    expect(peep.post).to eq 'ahmed is a great person'
    expect(peep.time).to eq '22:47'
  end
end
