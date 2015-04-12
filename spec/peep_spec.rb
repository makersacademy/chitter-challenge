require 'peep'
require 'helper_methods'

describe Peep do
  it 'can store a peep' do
    expect { add_peep }.to change(described_class, :count).by(1)
  end

  it 'can store a user' do
    peep = described_class.create(content: 'test',
                                  time: Time.now,
                                  user: 'demo_user')
    expect(peep.user).to include('demo_user')
  end
end
