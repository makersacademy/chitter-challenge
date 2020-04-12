require './lib/user'
describe User do
  context "signing up: " do
    it " should be able to create a new user with email address, username & password" do
    expect { User.new(name: 'eddoddo', pw: 'Secure_PW', email:'example@examples.com') }.not_to raise_error
    end
    it " should be able to tell me the details of the user" do
      eddo = User.new(name: 'eddoddo', pw: 'Secure_PW', email:'example@examples.com')
      expect(eddo.username).to eq('eddoddo')
      expect(eddo.password).to eq('Secure_PW')
      expect(eddo.email_address).to eq('example@examples.com')
    end
  end

  context "databasics: " do
    it " should be able to add a user to the database:" do
      User.create(usr: 'ed', pass: 'ed_pass', email: 'ed_email')
      expect(User.all[-1].username).to eq('ed')
     end
  end

  describe '.all' do
    it 'returns a list of users' do
      User.create(usr: 'Steven', pass: 'Steve_secure', email: 'Steve_email')
      people = User.all
      users = []
      people.each {|page| users.push(page.username) }
  
      expect(users).to include('Steven')
    end
  end
  
  describe '.authenticate' do
    it " returns true if the PW & username match one one the users table" do
      User.create(usr:'Gerald', pass: 'Gerald_secure', email: 'Gerald_email')
      expect(User.authenticate(usr: 'Gerald', pass: 'Gerald_secure')).to eq(true)
    end
  end
end