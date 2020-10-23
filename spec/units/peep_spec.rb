require 'peep'

describe Peep do
  subject(:peep) { Peep.new('1', 'my peep', '2', '2020-09-27 23:58:14 +0100') }

  it 'takes arguments of id, message, author and created_at on initialisation' do
    expect(Peep).to respond_to(:new).with(4).arguments
  end

  it 'sets the created_at value as a Time object equivalent' do
    created_at = '2020-09-27 23:58:14 +0100'

    expect(peep.created_at).to eq DateTime.parse(created_at)
  end
end
