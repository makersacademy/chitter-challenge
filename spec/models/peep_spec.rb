require_relative '../../app/models/peep.rb'

describe Peep do
  it 'cannot be created without content' do
    peep = Peep.new content: ""
    expect(peep.save).to be false
  end

  it 'limits content length to 140 characters' do
    peep = Peep.new content: "dfghtyjkcb dfghtyjkcb dfghtyjkcb dfghtyjkcb dfghtyjkcb dfghtyjkcb dfghtyjkcb dfghtyjkcb dfghtyjkcb dfghtyjkcb dfghtyjkcb dfghtyjkcb dfghtyjkcb dfghtyjkcb f"
    expect(peep.save).to be false
  end

  xit 'is created with a time stamp'
end