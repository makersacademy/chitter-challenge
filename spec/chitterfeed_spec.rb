require 'chitterfeed'

describe ChitterFeed do
  let(:user) { double('User', user_name: 'RickV') }

  it 'can post message content to DB' do
    ChitterFeed.add('Chitter_feed unit test')
    results = ChitterFeed.view
    expect(results[0].content).to include('Chitter_feed unit test')
  end

end