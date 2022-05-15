require './lib/user'

describe User do
  describe '.sign_up' do
    it 'takes user details and signs them up, storing them to a database' do
      connection = PG.connect(dbname: 'chitter')
      user = User.sign_up(full_name: 'Tina Belcher', username: 'boyz4now4evr', email: 'equestranaut2000@talk21.com', handle: 'equestranaut2000', password: 'jimmyjr1234')
      expect(user.full_name).to eq 'Tina Belcher'
      expect(user.password).to eq 'jimmyjr1234'
    end
  end
 end
