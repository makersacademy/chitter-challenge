require 'pg'

class Peep

  attr_reader :content, :time

  def initialize(content, time)
    @content = content
    @time = time
  end

  def self.all
    begin
      if ENV["Environment"] == 'test'
        con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
      else
        con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
      end

      rs = con.exec "SELECT content, time FROM peeps"

      rs.map do |row|
        Peep.new(row['content'], row['time'])
      end

      rescue PG::Error => e

      puts e.message

      ensure

      con.close if con
    end
  end

  def self.add(content, time)
    begin
      if ENV["Environment"] == 'test'
        con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
      else
        con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
      end

      rs = con.exec "INSERT INTO peeps (content, time) VALUES ('#{content}', '#{time}')"

      rescue PG::Error => e

      puts e.message

      ensure

      con.close if con
    end

  end

end
