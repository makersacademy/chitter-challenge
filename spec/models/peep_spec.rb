require_relative '../../app/models/peep.rb'

describe Peep do
  it 'cannot be created without content' do
    peep = Peep.new content: ""
    expect(peep.save).to be false
  end

  xit 'limits content length to 140 characters'

  xit 'is created with a time stamp'
end