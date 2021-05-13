require 'pg'
require 'dotenv'
require_relative 'query'
Dotenv.load

class Tag

  def self.add(text, peep_id)
    find(text).each do |tag|
      tag_id = Query.run("INSERT INTO tags (name) VALUES('#{tag}') RETURNING id;").first[:id]
      Query.run("INSERT INTO peep_tags (tag_id, peep_id) VALUES(#{tag_id}, #{peep_id});")
    end
  end

  def self.find(text)
    text.scan(/#\S+/)
  end

end
