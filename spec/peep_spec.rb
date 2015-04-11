require 'peep'

describe 'Peep' do
  # let(:peep) { described_class.new }
  it 'can store a peep' do
    expect{ add_peep }.to change(Peep, :count).by(1)
  end
end

def add_peep content = 'test'
  post = Peep.create(content: content)
  p post.saved?
end