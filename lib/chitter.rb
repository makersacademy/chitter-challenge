require 'pg'
require_relative './peep'
require_relative './tag'
require_relative './query'

class Chitter

  def self.all
    Query.run("SELECT * FROM peeps, users WHERE users.id = peeps.user_id ORDER BY date DESC").map { |result| Peep.new(result) }
  end

  def self.add(text:, id:)
    date = Time.now.strftime("%Y/%m/%d %k:%M:%S")
    peep_id = Query.run("INSERT INTO peeps (user_id, text, date) VALUES('#{id}','#{text}','#{date}') RETURNING id;").last[:id]
    Tag.add(text, peep_id)
  end

  def self.by_tag(tag)
    Query.run("SELECT*FROM peeps,users,tags,peep_tags WHERE users.id=peeps.user_id AND tags.id=peep_tags.tag_id AND peep_tags.peep_id=peeps.id AND tags.name='#{tag}' ORDER BY date DESC").map { |result| Peep.new(result) }
  end

  def self.by_user(username)
    Query.run("SELECT*FROM peeps,users WHERE users.id=peeps.user_id AND users.username='#{username}' ORDER BY date DESC").map { |result| Peep.new(result) }
  end

end
