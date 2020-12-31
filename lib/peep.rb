require 'pg'

class Peep

  attr_reader :content, :time, :username

  def initialize(content, time, username)
    @content = content
    @time = time
    @username = username
  end

  def self.all
    begin
      if ENV["Environment"] == 'test'
        con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
      else
        con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
      end

      rs = con.exec "SELECT content, time, username FROM peeps"

      rs.map do |row|
        Peep.new(row['content'], row['time'], row['username'])
      end

      rescue PG::Error => e

      puts e.message

      ensure

      con.close if con
    end
  end

  def self.add(content, time, username)
    begin
      if ENV["Environment"] == 'test'
        con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
      else
        con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
      end

      rs = con.exec "INSERT INTO peeps (content, time, username) VALUES ('#{content}', '#{time}', '#{username}')"

      rescue PG::Error => e

      puts e.message

      ensure

      con.close if con
    end

  end

end
