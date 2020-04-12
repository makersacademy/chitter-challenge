require 'peeps'

describe Peeps do

  it 'peeps to be able to store a peep' do
    peeps = Peeps.new
    peeps.add('1st peep')
    expect(peeps.messages).to include '1st peep'
  end
  
end
