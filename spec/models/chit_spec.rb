require './app/models/chit_model'

describe Chit do

  it 'no Chits in the database at the start of the test' do
    expect(Chit.count).to eq 0
  end

  it 'Can add a chit to the database' do
    chit = build(:chit)
    expect{ add_chit(chit) }.to change(Chit, :count).by(1)
  end

  it 'Text is not empty' do
    chit = build(:chit)
    add_chit(chit)
    data_chit= Chit.first
    expect(data_chit.text).not_to be(nil)
  end

  it 'records creation time' do
    chit = build(:chit)
    add_chit(chit)
    data_chit= Chit.first
    expect(Time.parse(data_chit.time)).to eq(Time.local(2015, 9, 1, 10, 5, 0))

  end



end
