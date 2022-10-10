require 'peep'
require 'peep_manager'

describe PeepManager do
  it 'adds new peep' do
    manager = PeepManager.new
    new_peep1 = Peep.new('2022-10-09 22:30:53.554154 UTC', 'a brand new test peep', 1)
    new_peep2 = Peep.new('2022-10-09 22:30:59.554154 UTC', 'oh boy fresh peeps to test', 2)
    manager.create(new_peep1)
    manager.create(new_peep2)

    expect(manager.all_peeps).to include(new_peep1)
    expect(manager.all_peeps).to include(new_peep2)
  end

  it 'displays peeps newest first' do
    manager = PeepManager.new
    new_peep1 = Peep.new('2022-10-09 22:30:53.554154 UTC', 'a brand new test peep', 1)
    new_peep2 = Peep.new('2022-10-09 22:30:59.554154 UTC', 'oh boy fresh peeps to test', 2)
    manager.create(new_peep1)
    manager.create(new_peep2)
    
    expect(manager.all_peeps).to eq [new_peep2, new_peep1]
  end
end
