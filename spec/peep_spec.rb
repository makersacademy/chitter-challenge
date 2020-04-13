require './lib/peep'
require './lib/user'

describe Peep do
  it "it can give a list of peeps in descending order" do
    con = PG.connect :dbname => 'chitter_test', :user => 'edwardphillips'
    con.exec("TRUNCATE users, peeps, tags;")
    User.create(usr:'testy', pass:'testy_secure', email:'test@test.com')
    who = User.all[-1].id
    con.exec("INSERT INTO peeps (text, user_id, time) VALUES ('Hallo', '#{who}', '#{Time.now.utc}')")
    con.exec("INSERT INTO peeps (text, user_id, time) VALUES ('Hello', '#{who}', '#{Time.now.utc}')")
    expect(Peep.all[-1].message).to eq 'Hallo'
  end
  it " can save a new peep to the peep database" do
    con = PG.connect :dbname => 'chitter_test', :user => 'edwardphillips'
    con.exec("TRUNCATE users, peeps, tags;")
    User.create(usr:'testy', pass:'testy_secure', email:'test@test.com')
    who = User.all[-1].id
    Peep.create(text:'HALLO', user: who)
    expect(Peep.all[0].message).to eq 'HALLO'
  end
end
