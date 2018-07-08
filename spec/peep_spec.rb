require 'peep'

describe Peep do

# let(:dbconnection) { double(:DatabaseConnection) }
  before(:each) do
    @user = User.create(name: 'Test', username: 'test123', email: 'test@example.com', password: '123')
    @time = Time.now
  end

  describe '.all' do
    it 'returns all peeps in an array' do
      peep_1 = Peep.create(comment: 'Wow cool peep', time: @time, user_id: @user.id)
      peep_2 = Peep.create(comment: 'It is a Twitter clone', time: @time, user_id: @user.id)
      peep_3 = Peep.create(comment: 'Call it Chitter', time: @time, user_id: @user.id)

      # dbobject = [
      #             {id:1, comment: "hello", time: "time", username: "Dan"},
      #             {id:2, comment: "cool", time: "time", username: "test"}
      #             ]
      # allow(dbconnection).to receive(:query).and_return(dbobject)

      expected_peeps = [
        peep_1,
        peep_2,
        peep_3
      ]

      expect(Peep.all).to eq expected_peeps
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(comment: 'Wow cool peep', time: @time, user_id: @user.id)
      expect(Peep.all).to include peep
    end
  end

  describe '#==' do
    it 'two peeps are equal if their IDs match' do
      peep1 = Peep.new('comment', '2018-07-07 19:11:46', 1, 'user')
      peep2 = Peep.new('comment', '2018-07-07 19:11:46', 1, 'user')
      expect(peep1).to eq peep2
    end
  end
end
