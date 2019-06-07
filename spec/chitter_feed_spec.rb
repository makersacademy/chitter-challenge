require 'chitter_feed'

describe Chitter_feed do
  it 'can post message content to DB' do
    subject.add('Chitter_feed unit test')
    expect(subject.view).to include('Chitter_feed unit test')
  end
end