require_relative '../lib/chitter'
require_relative '../lib/user'
require 'database_helpers'

describe Chitter do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      connection.exec("INSERT INTO user_chitter (id, first_name, last_name, user_email, user_password, user_name) VALUES(1,'Shirley', 'Mac', 'mac@gmail.com', 'password', 'SAM11');")
      connection.exec("INSERT INTO chitter (user_id, peep, DATE) select id, 'peep' , NOW() from user_chitter where user_email = 'mac@gmail.com';")

      chitter = Chitter.all

      expect(chitter.length).to eq 1
      expect(chitter[0][0]).to eq 'peep'
    end
  end

  # describe '.create' do
  #   it 'creates a peep' do
  #     connection = PG.connect(dbname: 'chitter_manager_test')
  #     connection.exec("INSERT INTO user_chitter (id, first_name, last_name, user_email, user_password, user_name) VALUES(1,'Shirley', 'Mac', 'mac@gmail.com', 'password', 'SAM11');")
  #     chitter = Chitter.create(peep: 'A peep', user_email: 'mac@gmail.com')
  #     #chitter_persisted_data = chitter_persisted_data(chitter_id: chitter.chitter_id)
  #     expect(chitter.peep).to eq 'A peep'
  #   end
  # end
end