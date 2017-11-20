require './app/models/peep.rb'

describe Peep do
  it 'store the peep in database' do
    expect { Peep.create(content: 'blablabla!') }.to change { Peep.all.length }.by(1)
  end
end
