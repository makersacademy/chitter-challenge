require './app/models/chit_model'

describe Chit do

  it 'Can add a chit to the database' do
    chit = build(:chit)
    expect{ add_chit(chit) }.to change(Chit, :count).by(1)
  end

  it 'Text is not empty' do
    chit = build(:chit)
    add_chit(chit)
    data_chit= Chit.first(id:'2')
    expect(data_chit.text).not_to be(nil)
  end

  it 'records creation time' do
    chit = build(:chit)
    add_chit(chit)
    data_chit= Chit.first(id:'3')
    expect(Time.parse(data_chit.time)).to eq(Time.local(2015, 9, 1, 10, 5, 0))

  end



end
