require './models/peep.rb'
require 'database_helpers'
require 'pg'

describe Peep do
  describe '#all_peeps' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_app_test')
      
      pusheen = User.create(fullname: 'Pusheen Cat', username: '@pusheen', email: 'pusheen@test.com', password: 'pusheen-password')
      gudetama = User.create(fullname: 'Gudetama', username: '@gudetama', email: 'gudetama@test.com', password: 'gudetama-password')
      yoda = User.create(fullname: 'Yoda', username: '@yoda', email: 'yoda@test.com', password: 'yoda-password')
  
      # Add the test data
      Peep.create(message: "Peep 1 by Pusheen", user: pusheen.id, username: '@pusheen')
      Peep.create(message: "Peep 2 by Gudetama", user: gudetama.id, username: '@gudetama')
      Peep.create(message: "Peep 3 by Yoda", user: yoda.id, username: '@yoda')

      peeps = Peep.all_peeps

      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'Peep 3 by Yoda'
    end
  end

  describe '#create' do
    it 'creates a new peep' do

      pusheen = User.create(fullname: 'Pusheen Cat', username: '@pusheen', email: 'pusheen@test.com', password: 'pusheen-password')

  
      # Add the test data
      peep = Peep.create(message: "New Peep by Pusheen", user: pusheen.id, username: '@pusheen')
      
      persisted_data = PG.connect(dbname: 'chitter_app_test').query("SELECT * FROM peep_messages WHERE id = #{peep.id};")
      
      expect(peep.message).to eq 'New Peep by Pusheen'

    end
  end

end