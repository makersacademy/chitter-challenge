describe Peep do
  let(:username) { 'tester1' }
  let(:user) { 'Test Name' }
  let(:email) { 'email' }
  let(:password) { 'password' }
  let(:oldest_peep_time) { '2020-08-24 21:05:0.000001+01' }
  let(:oldest_peep) { 'an older peep' }
  let(:newest_peep_time) { '2020-08-24 21:10:0.000001+01' }
  let(:newest_peep) { 'a newer peep' }
  
  before do
    @usr = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES ('#{user}','#{username}','#{email}','#{password}') RETURNING id")
    DatabaseConnection.query("INSERT INTO peeps (body, created_at, user_id) VALUES ('#{oldest_peep}', '#{oldest_peep_time}', '#{@usr[0]['id']}'), ('#{newest_peep}', '#{newest_peep_time}', '#{@usr[0]['id']}')")
  end
  
  describe '#all' do
    it 'returns an array of peeps' do
      expect(Peep.all).to all(be_an_instance_of(Peep))
    end

    it 'returns an array that is sorted reverse chronologically' do
      expect(Peep.all[0].created_at).to be > Peep.all[-1].created_at
    end
  end

  describe 'a peep instance' do  
    let(:peep) { Peep.all.first }
    
    it 'returns the body text' do
      expect(peep.body).to eq newest_peep
    end

    it 'returns the time_created' do
      expect(peep.created_at).to eq Time.strptime(newest_peep_time, '%Y-%m-%d %H:%M:%S.%N%z')
    end

    it 'returns the user_id of the creator' do
      expect(peep.user_id).to eq @usr[0]['id']
    end

    describe '#author' do
      it 'returns the username of the user_id' do
        expect(peep.author).to eq username
      end
    end
  end
end
