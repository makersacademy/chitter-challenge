require_relative '../lib/peep'
require_relative '../lib/user'

describe Peep do
  let(:subject) { Peep }
  let(:user) { User.create(name:'user 1', username: 'user1', email: 'email', password: 'password') }

 

  describe '.all' do
    it { expect(subject.all).to be_a Array }

    it 'sets timestamp instance variable' do
      time = Time.now.strftime("%Y-%m-%d %H:%M")
      subject.create(text: 'My first peep', timestamp: time, user_id: user.id)
      expect(subject.all.first.timestamp).to include(time)
    end

    it 'wraps database data in Peep object and assigns instance variables' do
      Peep.create(text: 'My second peep', user_id: user.id)
      expect(subject.all.first.text).to eq 'My second peep'
    end
  end

  describe '.create' do
    it 'creates new peep' do
      peep = subject.create(text: 'My third peep', user_id: user.id)
      expect(peep.first['text']).to include('My third peep')
    end

    it 'adds timestamp' do
      time = Time.now.strftime("%Y-%m-%d %H:%M")
      peep = subject.create(text: 'My fourth peep', timestamp: time, user_id: user.id)
      expect(peep.first['timestamp']).to include(time.to_s)
    end

    it 'adds user_id' do
      peep = subject.create(text: 'My fourth peep', user_id: user.id)
      expect(peep.first['user_id']).to eq user.id
    end
  end

end
