require "capybara/rspec"
require './app'
require 'PG'
feature 'the user can sign up' do
  describe 'signing up' do
    it 'allows the user to sign up' do
    conn = PG.connect(dbname: 'chitter_signup')
    conn.exec("TRUNCATE ONLY details RESTART IDENTITY;")
    conn.exec("INSERT INTO details (username , password) VALUES('TestUser1' , 'TestPass1')")
    res = conn.exec("SELECT username, password FROM details")
    uname = res.map { |username| username['username'] }
    pword = res.map { |password| password['password'] }

    expect(uname).to include("TestUser1")
    expect(pword).to include("TestPass1")

end
end
end
