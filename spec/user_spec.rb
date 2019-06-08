require 'user'

describe '.all' do
let(:connection)  { PG.connect(dbname: 'chitter_test') }
let(:user)   { User.all }

  it 'Returns a list of Users' do
    connection.exec("INSERT INTO userdetails(id, name, user_name, email) VALUES(1, 'Helen', 'HelenAtMakers', 'helen@gmail.com');")
    connection.exec("INSERT INTO userdetails(id, name, user_name, email) VALUES(2, 'Phoebe', 'LiveFastDieYoung', 'phoebe@gmail.com');")
    connection.exec("INSERT INTO userdetails(id, name, user_name, email) VALUES(3, 'Rachael', 'PrincessConsuela', 'rachael@gmail.com');")
    expect(user[0].name).to eq "Helen"
    expect(user[1].user_name).to eq "LiveFastDieYoung"
    expect(user[2].email_address).to eq "rachael@gmail.com"
  end
end

describe '.create' do
let(:connection)  { PG.connect(dbname: 'chitter_test') }
let(:user)   { User.all }
  
    it 'Creates a new Peep' do
      User.create('1', 'Helen', 'HelenAtMakers', 'helen@gmail.com')
      User.create('2', 'Phoebe', 'LiveFastDieYoung', 'phoebe@gmail.com')
      User.create('3', 'Rachael', 'PrincessConsuela', 'rachael@gmail.com')
      expect(user[0].user_name).to eq "HelenAtMakers"
      expect(user[1].email_address).to eq "phoebe@gmail.com"
      expect(user[2].name).to eq "Rachael"
    end
  end
  