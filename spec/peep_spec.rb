require 'peep'

RSpec.describe Peep do
  it 'is valid with valid attributes' do
    peep = Peep.new(text: "Hey there")
    expect(peep.valid?).to eq true
  end

  it 'is invalid if text is blank' do
    peep = Peep.new(text: "")
    expect(peep.valid?).to eq false  
  end
end
