require 'peep'
require 'peep_manager'

describe PeepManager do
  it 'adds new peep' do
    manager = PeepManager.new
    new_peep = Peep.new('Test peep', 'Hello!')

    manager.add_peep(new_peep)

    expect(manager.all_peeps).to include(new_peep)
  end

  it 'adds new peep' do
    manager = PeepManager.new
    new_peep_1 = Peep.new('jeanbu', 'Hello!')
    new_peep_2= Peep.new('jeanbu2', 'Hi!')

    manager.add_peep(new_peep_1)
    manager.add_peep(new_peep_2)

    expect(manager.all_peeps).to include(new_peep_1)
    expect(manager.all_peeps).to include(new_peep_2)
  end
end