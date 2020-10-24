require 'peep'
require 'database_helpers'
require 'user'

describe Peep do
  let(:peep_class) { described_class }
  let(:user_class) {double :user_class}

  describe '.user' do
    it 'asks the User class for current_session information' do
      expect(user_class).to receive(:current_user)
      Peep.user(user_class)
    end
  end

  describe '.all' do
    let(:peep_class) { described_class }
    let(:user_class) {double :user_class}
    it 'returns array of all peeps' do
      reset_test_database
      allow(peep_class).to receive(:user).with(user_class).and_return("Anonymous")
      peep_class.create("One peep", user_class)
      peep_class.create("Two peep", user_class)
      peeps = Peep.all
      first_peep = peeps.first
      second_peep = peeps[1]
      
      expect(peeps).to be_a Array
      expect(peeps.length).to eq 2
      expect(first_peep.content).to eq "One peep" 
      expect(second_peep.content).to eq "Two peep"
    end
  end

  describe '.create' do
    it 'creates a peep' do
      allow(peep_class).to receive(:user).with(user_class).and_return("Anonymous")
      peep = peep_class.create("I created a peep!", user_class)
      expect(peep).to be_a Peep
      expect(peep.content).to eq "I created a peep!"
    end

    it 'creates a peep within the database' do
      allow(peep_class).to receive(:user).with(user_class).and_return("Anonymous")
      peep = peep_class.create("Hello", user_class)
      data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep.id).to eq data.first['id']
      expect(peep.content).to eq data.first['content']
      expect(peep.time).to eq data.first['time']
    end

    it 'adds a user_id if user is present' do
      user = User.create(name: "Rose Tyler", username: "badwolf", email: "rtyler@tardis.com", password: "raxacoricofallapatorius")
      peep = Peep.create("I miss the doctor")
      data = persisted_data(table: 'peeps', id: peep.id)

      expect(data.first['user_id']).to eq(user.id)
    end
  end

  describe '#time' do
    it 'knows what time it was created' do
      allow(peep_class).to receive(:user).with(user_class).and_return("Anonymous")
      now = Time.now.strftime("%d/%m/%Y, %I:%M %p")
      peep = peep_class.create("Just woke up", user_class)
      expect(peep.time).to eq now
    end
  end

end