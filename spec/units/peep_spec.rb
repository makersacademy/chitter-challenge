require 'peep'

describe Peep do
  subject(:peep) { Peep.new('1', 'my peep', '2', 1601222521) }

  it 'takes arguments of id, message, author and created_at on initialisation' do
    expect(Peep).to respond_to(:new).with(4).arguments
  end

  it 'sets the created_at value as a Time object equivalent' do
    created_time = Time.at(1601222521).utc.to_datetime

    expect(peep.created_at).to eq created_time
  end
end
