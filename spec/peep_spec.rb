require 'peep'

RSpec.describe Peep do
  let(:test_peep) { Peep.where(body: 'message').first }

  before(:each) do
    Peep.create body: 'message'
  end

  it 'can contain a message' do
    expect(test_peep.body).to eq 'message'
  end

  it 'has likes and can be liked' do
    test_user_id = 1
    expect { test_peep.receive_like test_user_id, test_peep.id }.to change { Like.all_for test_peep }.by 1
  end

  it 'keeps a record of the time it was posted' do
    expect(test_peep.timestamp).to eq Time.now.utc.strftime('%k:%M')
  end

  describe '.all_by(user_id)' do
    let(:results) { Peep.all_by(first_user_id).map(&:body) }
    let(:first_user_id) { 1 }
    let(:second_user_id) { 2 }
    let(:third_user_id) { 3 }

    before(:each) do
      Peep.create body: 'I am first_user and this is my peep', user_id: first_user_id
      Peep.create body: 'I am second_user and this is my peep', user_id: second_user_id
      Peep.create body: 'I am third_user and this is my peep', user_id: third_user_id
      Peep.create body: 'I am first_user and this is also my peep', user_id: first_user_id
    end

    it 'returns all tweets by a target user' do
      expect(results).to include 'I am first_user and this is my peep'
      expect(results).to include 'I am first_user and this is also my peep'
    end

    it 'does not return any tweets not authored by the target user' do
      expect(results).not_to include 'I am second_user and this is my peep'
      expect(results).not_to include 'I am third_user and this is my peep'
    end
  end
end
