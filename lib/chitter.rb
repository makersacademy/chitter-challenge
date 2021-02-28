require 'pg'
require_relative './peep'

class Chitter

  def self.all
    query("SELECT * FROM peeps, users WHERE users.id = peeps.user_id ORDER BY date DESC").map { |result| Peep.new(result) }
  end

  def self.add(text:, id:)
    date = Time.now.strftime("%Y/%m/%d %k:%M")
    query("INSERT INTO peeps (user_id, text, date) VALUES('#{id}','#{text}','#{date}');")
  end

  def self.query(query_string)
    results = PG.connect(dbname: "chitter#{ENV['ENVIRONMENT']}").exec(query_string)
    results.map { |result| result.transform_keys(&:to_sym) }
  end

end
