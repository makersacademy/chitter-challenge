require 'peep'

RSpec.describe Peep do
  it 'constructs' do
    peep = Peep.new('my wife just left me')
    expect(peep.read).to eq 'my wife just left me'
  end
end