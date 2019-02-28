require 'pg'

class Peep
  def self.connection
    ENV['ENVIRONMENT'] == 'test' ? @conn = PG.connect(dbname: 'chitter_test') : @conn = PG.connect(dbname: 'chitter')
  end

  def self.add(username, content)
    connection
    @conn.exec("INSERT INTO peeps VALUES(DEFAULT, '#{content}', '#{username}')")
  end

  def self.all
    connection
    peeps = []
    @conn.exec("SELECT * FROM peeps") do |result|
      result.each do |row|
        peeps << row
      end
    end
    peeps
  end
end
