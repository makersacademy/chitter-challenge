require 'peep'

describe Peep do
  before(:each) { truncates }
  before(:each) { add_peep }

  it '#create adds a new Peep to database' do
    Peep.create('Lin', '@LinnyCodes', "Oh cool! I can add a new peep too!")
    output = Peep.all
    expect(output[0].author).to eq('Lin')
    expect(output[0].handle).to eq('@LinnyCodes')
    expect(output[0].content).to include("Oh cool! I can add a new peep too!")
  end

  it 'has a time' do
    output = Peep.all
    t = Time.new.strftime("%k:%M")
    expect(output[0].time).to include(t)
  end
end