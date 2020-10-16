describe Peep do
  let(:username) { 'tester1' }
  let(:user) { 'Test Name' }
  let(:email) { 'email' }
  let(:password) { 'password' }
  let(:oldest_peep_time) { Time.new(2020, 8, 24, 21, 5) }
  let(:oldest_peep) { 'an older peep' }
  let(:newest_peep_time) { Time.new(2020, 8, 24, 21, 10) }
  let(:newest_peep) { 'a newer peep' }
  let(:date_format) { '%d-%m-%Y %H:%M' }
  
  before do
    user = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES ('#{user}','#{username}','#{email}','#{password}') RETURNING id")
    DatabaseConnection.query("INSERT INTO peeps (body, created_at, user_id) VALUES ('#{newest_peep}', '#{newest_peep_time}', '#{user[0]['id']}')")
    # DatabaseConnection.query("INSERT INTO peeps (body, created_at, user_id) VALUES ('#{oldest_peep}', '#{oldest_peep_time}', '#{user[0]['id']}'), ('#{newest_peep}', '#{newest_peep_time}', '#{user[0]['id']}')")
  end
  
  describe '#all' do
    it 'returns an array of peeps' do
      expect(Peep.all).to all(be_an_instance_of(Peep))
    end
  end

  describe 'a peep instance' do  
    let(:peep) { Peep.all[0] }
    
    it 'returns the body text' do
      expect(peep.body).to eq newest_peep
    end

    it 'returns the time_created' do
      expect(peep.created_at).to eq newest_peep_time
    end
  end
end
