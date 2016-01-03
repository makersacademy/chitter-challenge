require_relative '../../app/models/peep'

describe Peep do

  let(:content) { "some content" }

  before do
    User.create(name: 'camilla', email: 'camilla@email.com', username: 'allimac',
                  password: 'pass123', password_confirmation: 'pass123')
  end

  it 'returns time in a readable format (1 minute/s ago)' do
    peep = Peep.create(content: content, created_at: (Time.now-60*3))
    expect(peep.how_long_ago).to eq('3 minutes ago')
  end

  it 'returns time in a readable format (1 hour/s ago)' do
    peep = Peep.create(content: content, created_at: (Time.now-60*60*3))
    expect(peep.how_long_ago).to eq('3 hours ago')
  end

end
