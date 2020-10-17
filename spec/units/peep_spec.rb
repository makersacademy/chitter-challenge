describe Peep do
  let(:username) { 'tester1' }
  let(:user) { 'Test Name' }
  let(:email) { 'email' }
  let(:password) { 'password' }
  let(:oldest_peep) { 'an older peep' }
  let(:newest_peep) { 'a newer peep' }
  
  before do
    @usr = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES ('#{user}','#{username}','#{email}','#{password}') RETURNING id").first
    Peep.create(body: oldest_peep, user_id: @usr['id'])
    Peep.create(body: newest_peep, user_id: @usr['id'])
  end
  
  describe '#all' do
    it 'returns an array of peeps' do
      expect(Peep.all).to all(be_an_instance_of(Peep))
    end

    it 'returns an array that is sorted reverse chronologically' do
      expect(Peep.all.first.created_at).to be > Peep.all.last.created_at
      expect(Peep.all.first.body).to eq newest_peep
      expect(Peep.all.last.body).to eq oldest_peep
    end
  end

  describe '#create' do
    it 'inserts a row into the peeps table' do
      persisted_data = DatabaseConnection.query("SELECT * FROM peeps WHERE user_id=#{@usr['id']}")
      expect(persisted_data.first['body']).to eq oldest_peep
    end
  end

  describe 'a peep instance' do  
    let(:peep) { Peep.all.first }
    
    it 'returns the body text' do
      expect(peep.body).to eq newest_peep
    end

    it 'returns the time_created' do
      expect(peep.created_at).to be_a Time
      expect(peep.created_at)
    end

    it 'returns the user_id of the creator' do
      expect(peep.user_id).to eq @usr['id']
    end

    describe '#author' do
      it 'returns the username of the user_id' do
        expect(peep.author).to eq username
      end
    end
  end
end
