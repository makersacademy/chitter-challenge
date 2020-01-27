require './lib/models/peep'
require './lib/models/user'

describe Peep do 
  let(:user) { double(:user, uid: User.all.first.uid, msg: 'First peep') }
  let(:subject) { Peep }
  let(:row) { { 'uid' => User.all.first.uid, 'msg' => 'First peep', 'created_at' => '20-01-2020 18:00' }}

  let(:subject2) { Peep.new(row) }
  
  describe '#initialization' do
    it 'initializes an instance of a peep' do 
      expect(subject2.uid).to eq User.all.first.uid
      expect(subject2.created_at).to be_a Time
      expect(subject2.msg).to eq 'First peep'
    end
  end

  describe '.create' do
    it 'creates a peep entry in the database' do
      subject.create(uid: user.uid, msg: user.msg)
      expect(subject.all.first.uid).to eq User.all.first.uid
    end
  end

  describe '.all' do
    it 'returns a list of all peeps' do
      subject.create(uid: user.uid, msg: user.msg)
      expect(subject.all).to be_a Array
      expect(subject.all.last.msg).to eq 'First peep'
      expect(subject.all.last).to be_a Peep
    end
  end

end
  