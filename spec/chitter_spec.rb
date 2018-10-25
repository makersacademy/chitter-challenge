require 'chitter'

describe Chitter do
  # it 'allows user to post a peep' do
  #   peeps = Chitter.all
  #   new_peep = Chitter.create_peep('My first peep')
  #   expect(peeps).to include new_peep
  # end

  it 'lists all peeps' do
    peeps = Chitter.all
    expect(peeps).to include 'My first peep'
  end

end
