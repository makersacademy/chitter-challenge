require_relative '../lib/Databasehandler'

describe Database do
  describe 'Verifies user logins' do
    it 'Returns true if correct login details' do
      expect(subject.verifyLogin("FAKEEMAIL@hotmail.co.uk", "pass")).to eq true
    end
    it 'Returns false if incorrect login details' do
      expect(subject.verifyLogin("FAKEEMAIL@hotmail.co.uk", "wrongpass")).to eq false
    end
    it 'Returns false if user does not exist' do
      expect(subject.verifyLogin("RANDOMEMAIL@hotmail.co.uk", "pass")).to eq false
    end
  end
  describe 'Can add a new user' do
    it 'can add a new user to the database' do
      subject.createUser("Kwame Mintah", "Wammy", "FAKEEMAIL2@hotmail.co.uk", "pass")
      expect(subject.verifyLogin("FAKEEMAIL2@hotmail.co.uk", "pass")).to eq true
    end
    it 'cannot add users if the credentials are taken' do
      expect(subject.createUser("Benjamin Kearns", "Benny", "FAKEEMAIL@hotmail.co.uk", "pass")).to eq "USERERROR-CREDENTIALSTAKEN"
    end
    it 'cannot add users if the handle is taken' do
      expect(subject.createUser("Darren Coombs", "Coombszy", "FAKEEMAIL3@hotmail.co.uk", "pass")).to eq "USERERROR-CREDENTIALSTAKEN"
    end
  end
  describe 'can manipulate peeps in the database' do
    it 'can add a peep' do
      temp = Array.new
      subject.GetPeeps(Date.today.year, Date.today.month, Date.today.day).each do |data|
        temp.push(data)
      end
      start = temp.count
      subject.CreatePeep('God', 'TESTPEEP-FROMRSPEC')
      subject.GetPeeps(Date.today.year, Date.today.month, Date.today.day).each do |data|
        temp.push(data)
      end
      after = temp.count
      expect(start).to be < after
    end
  end
end