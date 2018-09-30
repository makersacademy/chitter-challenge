require 'peep'

RSpec.describe Peep do

  subject { described_class.new(1, 'billy1', 'Hello, Chitter!', Time.now.to_s) }

  it 'should have a username attached' do
    expect(subject.username).to eq 'billy1'
  end

  it 'should have content' do
    expect(subject.content).to eq 'Hello, Chitter!'
  end

  it 'should have a post time attached' do
    expect(subject.post_time).to eq 'now'
  end

  it 'knows when it is a reply' do
    expect(subject.reply_to).to eq nil
  end
end
