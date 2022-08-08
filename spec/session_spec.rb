require './lib/user'
require './lib/session'


describe User do
  describe '.login' do
    it 'checks the database for matching details' do
      connection = PG.connect(dbname: 'chitter')
      user = User.sign_up(full_name: 'Tina Belcher', username: 'boyz4now4evr', email: 'equestranaut2000@talk21.com', handle: 'equestranaut2000', password: 'jimmyjr1234')
      result = Session.find_user(handle: user.handle, password: user.password)
      expect(result.password).to eq user.password
      expect(result.handle).to eq user.handle
    end
  end
 end