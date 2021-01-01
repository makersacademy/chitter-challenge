require 'peep'

describe 'Peep' do

  it 'expects peep to respond to method .all' do
    expect(Peep).to respond_to :all
  end

end 
