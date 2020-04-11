require './lib/peep'
require './lib/user'

describe Peep do
  context "it can give a list of peeps in descending order" do
    con = PG.connect :dbname => 'chitter_test', :user => 'edwardphillips'
    con.exec("TRUNCATE users, peeps;")
    User.create(usr:'testy', pass:'testy_secure', email:'test@test.com')
    who = User.all[-1].id
    con.exec("INSERT INTO peeps (text, user_id, time) VALUES ('Hallo', '#{who}', '#{Time.now.utc}')")
    expect(Peep.all[0].message).to eq 'Hallo'
  end
end