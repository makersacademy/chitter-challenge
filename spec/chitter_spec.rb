require 'peep'

describe 'all' do
  it 'shows a list of all peeps' do
    Peep.create("hey!")
    Peep.create("bye!")
    peeps = Peep.all.map { |object| object.peep }
    expect(peeps).to include("hey!")
    expect(peeps).to include("bye!")
  end

  it 'tests ORM' do
    Peep.create('pie')
    Peep.create('destroy')

    peeps = Peep.all
    test_peep = Peep.all.first

    expect(peeps.length).to eq 2
    expect(test_peep).to respond_to(:id)
    expect(test_peep.peep).to eq("pie")
  end

end
