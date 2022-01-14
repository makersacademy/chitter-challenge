require 'peep'

describe '.create_peep' do
  it "allows the Maker to write and post a new message (peep)" do
    Peep.create_peep(message: 'my second peep')

    expect(Peep.all).to include('my second peep')
  end
end
