require "pg"

class Peep
  attr_reader :content, :date

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
      peeps = connection.exec("SELECT content, date_trunc('minute', date_time_created) formated_time FROM peeps;")
      peeps.map { |peep|
        Peep.new(content: peep["content"], date: peep["formated_time"])
      }
      # Post.new(number: post_add[0["post_id"], name: post_add[0]["user_name"], content: post_add[0]["content"])
    rescue PG::Error => e
      puts e.message
    ensure
      peeps.clear if peeps
      connection.close if connection
    end
  end

  def initialize(content:, date:)
    @content = content
    @date = date
  end
end
