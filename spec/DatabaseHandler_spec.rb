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
      expect(subject.CreateUser("Kwame Mintah", "Wammy", "FAKEEMAIL2@hotmail.co.uk", "pass")).to be_between(0,99999)
      expect(subject.verifyLogin("FAKEEMAIL2@hotmail.co.uk", "pass")).to eq true
      subject.RemoveUser("FAKEEMAIL2@hotmail.co.uk")
    end
    it 'cannot add users if the credentials are taken' do
      expect(subject.CreateUser("Benjamin Kearns", "Benny", "FAKEEMAIL@hotmail.co.uk", "pass")).to eq "USERERROR-CREDENTIALSTAKEN"
    end
    it 'cannot add users if the handle is taken' do
      expect(subject.CreateUser("Darren Coombs", "Coombszy", "FAKEEMAIL3@hotmail.co.uk", "pass")).to eq "USERERROR-CREDENTIALSTAKEN"
    end
  end
  describe 'can manipulate peeps in the database' do
    it 'can add a peep' do
      temp = Array.new
      subject.GetPeeps(Date.today.year, Date.today.month, Date.today.day).each do |data|
        temp.push(data)
      end
      start = temp.count
      peepid = subject.CreatePeep('God', 'TESTPEEP-FROMRSPEC')
      subject.GetPeeps(Date.today.year, Date.today.month, Date.today.day).each do |data|
        temp.push(data)
      end
      after = temp.count
      expect(start).to be < after
      subject.DeletePeep(peepid)
    end
    it 'get a peek from the database' do
      peepid = subject.CreatePeep('God', 'TEMPPEEP')
      expect(subject.GetAPeep(peepid)).to include("peepcontent"=>"TEMPPEEP")
      subject.DeletePeep(peepid)
    end
    it 'cant get a peep that doesnt exsist' do
      expect(subject.GetAPeep(99999)).to eq 'PEEPERROR-DOESNOTEXIST'
    end
    it 'can delete a peep' do
      peepid = subject.CreatePeep('God', 'TEMPPEEP')
      subject.DeletePeep(peepid)
      expect(subject.GetAPeep(peepid)).to eq 'PEEPERROR-DOESNOTEXIST'
    end
  end
end