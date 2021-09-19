require 'chitter'

describe '#chitter' do

    let(:user_id) { 1 }
    let(:peep) {"This is a new peep"}
    
    it '.create' do
        connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
        connection.exec("INSERT INTO students (email, username, student_name, password) VALUES ('samp_email@gmail.com','davio','David','123456');")

        ChitterApp.create(user_id,peep)
        result = ChitterApp.all
        expect(result[0]).to include "This is a new peep"
    end

    it '.all' do
        #ChitterApp.create(user_id,peep)
        result = ChitterApp.all
        expect(result[0]).to include "This is a new peep"
    end
  end

