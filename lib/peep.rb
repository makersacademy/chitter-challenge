require 'pg'

class Peep

  def self.create(entry)
    begin
      if ENV["RACK_ENV"] == "test"
        connection = PG.connect :dbname => "chitter_chatter_test"
      else
        connection = PG.connect :dbname => "chitter_chatter"
      end
      peep_add = connection.exec("INSERT INTO peeps (content) VALUES ('#{entry}');")
      # Post.new(number: post_add[0["post_id"], name: post_add[0]["user_name"], content: post_add[0]["content"])
    rescue PG::Error => e
      puts e.message
    ensure
      peep_add.clear if peep_add
      connection.close if connection
    end
  end
  end

end