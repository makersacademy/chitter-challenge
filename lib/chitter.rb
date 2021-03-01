require 'pg'
require_relative './peep'
require_relative './tag'


class Chitter

  def self.all
    query("SELECT * FROM peeps, users WHERE users.id = peeps.user_id ORDER BY date DESC").map { |result| Peep.new(result) }
  end

  def self.add(text:, id:)
    date = Time.now.strftime("%Y/%m/%d %k:%M:%S")
    peep_id = query("INSERT INTO peeps (user_id, text, date) VALUES('#{id}','#{text}','#{date}') RETURNING id;").last[:id]
    Tag.add(text, peep_id)
  end

  def self.by_tag(tag)
    query("SELECT*FROM peeps,users,tags,peep_tags WHERE users.id=peeps.user_id AND tags.id=peep_tags.tag_id AND peep_tags.peep_id=peeps.id AND tags.name='#{tag}' ORDER BY date DESC").map { |result| Peep.new(result) }
  end

  def self.by_user(username)
    query("SELECT*FROM peeps,users WHERE users.id=peeps.user_id AND users.username='#{username}' ORDER BY date DESC").map { |result| Peep.new(result) }
  end

  def self.query(query_string)
    results = PG.connect(dbname: "chitter#{ENV['ENVIRONMENT']}").exec(query_string)
    results.map { |result| result.transform_keys(&:to_sym) }
  end

end
