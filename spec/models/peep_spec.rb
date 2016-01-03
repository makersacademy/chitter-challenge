require_relative '../../app/models/peep'

describe Peep do

  let(:content) { "some content" }

  before do
    User.create(name: 'camilla', email: 'camilla@email.com', username: 'allimac',
                  password: 'pass123', password_confirmation: 'pass123')
  end

  it 'returns time in a readable format (just now)' do
    peep = Peep.create(content: content, created_at: (Time.now))
    expect(peep.how_long_ago).to eq('just now')
  end

  it 'returns time in a readable format (6 seconds ago)' do
    peep = Peep.create(content: content, created_at: (Time.now-6))
    expect(peep.how_long_ago).to eq('6 seconds ago')
  end

  it 'returns time in a readable format (a minute ago)' do
    peep = Peep.create(content: content, created_at: (Time.now-60))
    expect(peep.how_long_ago).to eq('a minute ago')
  end

  it 'returns time in a readable format (3 minutes ago)' do
    peep = Peep.create(content: content, created_at: (Time.now-60*3))
    expect(peep.how_long_ago).to eq('3 minutes ago')
  end

  it 'returns time in a readable format (an hour ago)' do
    peep = Peep.create(content: content, created_at: (Time.now-60*60))
    expect(peep.how_long_ago).to eq('an hour ago')
  end

  it 'returns time in a readable format (3 hours ago)' do
    peep = Peep.create(content: content, created_at: (Time.now-60*60*3))
    expect(peep.how_long_ago).to eq('3 hours ago')
  end

  it 'returns time in a readable format (a day ago)' do
    peep = Peep.create(content: content, created_at: (Time.now-60*60*24))
    expect(peep.how_long_ago).to eq('a day ago')
  end

  it 'returns time in a readable format (2 days ago)' do
    peep = Peep.create(content: content, created_at: (Time.now-60*60*24*2))
    expect(peep.how_long_ago).to eq('2 days ago')
  end

  it 'returns time in a readable format (a week ago)' do
    peep = Peep.create(content: content, created_at: (Time.now-60*60*24*7))
    expect(peep.how_long_ago).to eq('a week ago')
  end

  it 'returns time in a readable format (3 weeks ago)' do
    peep = Peep.create(content: content, created_at: (Time.now-60*60*24*7*3))
    expect(peep.how_long_ago).to eq('3 weeks ago')
  end
end
