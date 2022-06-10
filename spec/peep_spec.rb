require 'peep'

RSpec.describe Peep do
  it 'constructs' do
    peep = Peep.new('my wife just left me')
    expect(peep.read).to eq 'my wife just left me'
  end

  it 'shows a different peep' do
    peep = Peep.new('my wife came back!')
    expect(peep.read).to eq 'my wife came back!'
  end
end