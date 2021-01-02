require 'pg'

class Peep

  attr_reader :content, :time, :user_id

  def initialize(content, time, username)
    @content = content
    @time = time
    @user_id = username
  end

  def self.all
    begin
      if ENV["Environment"] == 'test'
        con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
      else
        con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
      end

      rs = con.exec "SELECT content, time, user_id FROM peeps"

      rs.map do |row|
        Peep.new(row['content'], row['time'], row['user_id'].to_i)
      end

      rescue PG::Error => e

      puts e.message

      ensure

      con.close if con
    end
  end

  def self.add(content, time, user_id)
    begin
      if ENV["Environment"] == 'test'
        con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
      else
        con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
      end

      rs = con.exec "INSERT INTO peeps (content, time, user_id) VALUES ('#{content}', '#{time}', '#{user_id}')"

      rescue PG::Error => e

      puts e.message

      ensure

      con.close if con
    end

  end

end
