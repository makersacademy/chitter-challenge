require 'pg'

class Peep

  def self.all
    begin
      if ENV["Environment"] == 'test'
        con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
      else
        con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
      end

      rs = con.exec "SELECT content FROM peeps"

      rs.map do |row|
        "%s" % [ row['content'] ]
      end

      rescue PG::Error => e

      puts e.message

      ensure

      con.close if con
    end
  end

  def self.add(content)
    begin
      if ENV["Environment"] == 'test'
        con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
      else
        con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
      end

      rs = con.exec "INSERT INTO peeps (content) VALUES ('#{content}')"

      rescue PG::Error => e

      puts e.message

      ensure

      con.close if con
    end

  end

end
