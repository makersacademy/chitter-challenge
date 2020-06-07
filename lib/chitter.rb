require 'pg'

class Chitterer

  attr_reader :uname, :psw, :chit, :t1, :chit, :t1

  def initialize(uname:, chit:)

    @uname = uname
    @chit = chit

  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitterdatabase_test')
    else
      connection = PG.connect(dbname: 'chitterdatabase')
    end
    result = connection.exec("SELECT * FROM chits ORDER BY id DESC")
    result.map do |chits|
      Chitterer.new(chit: chits['chit'], uname: chits['username'])
    end
  end

  def self.login(uname:, psw:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitterdatabase_test')
    else
      connection = PG.connect(dbname: 'chitterdatabase')
    end
    connection.exec("SELECT username FROM chitter WHERE username='#{uname}' AND password='#{psw}';")
  end
# INSERT INTO chitter(username, password) VALUES ('#{uname}','#{psw}');")
  def self.create(chit:, uname:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitterdatabase_test')
    else
      connection = PG.connect(dbname: 'chitterdatabase')
    end
    connection.exec("INSERT INTO chits(chit, username) VALUES ('#{chit}','#{uname}');")
  end
end
