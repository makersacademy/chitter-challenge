require 'pg'

class Peep

  attr_reader :content

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

  def self.all
    begin
      if ENV["RACK_ENV"] == "test"
        connection = PG.connect :dbname => "chitter_chatter_test"
      else
        connection = PG.connect :dbname => "chitter_chatter"
      end
      peeps = connection.exec("SELECT * FROM peeps;")
        peeps.map { |peep|
          Peep.new(content: peep["content"])
        }
      # Post.new(number: post_add[0["post_id"], name: post_add[0]["user_name"], content: post_add[0]["content"])
    rescue PG::Error => e
      puts e.message
    ensure
      peeps.clear if peeps
      connection.close if connection
    end
  end

  def initialize(content:)
    @content = content
  end

end
