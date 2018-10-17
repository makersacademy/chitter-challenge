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

  it 'knows when a minute has elapsed since the peep' do
    @time_for_a_minute = Time.now - 60
    allow(Time).to receive(:now).and_return(@time_for_a_minute)
    expect(subject.post_time).to eq '1 minute ago.'
  end

  it 'knows when five minutes has elapsed since the peep' do
    @time_for_five_minutes = Time.now - 300
    allow(Time).to receive(:now).and_return(@time_for_five_minutes)
    expect(subject.post_time).to eq '5 minutes ago.'
  end

  it 'knows when it is a reply' do
    expect(subject.reply_to).to eq nil
  end
end
