require 'pg'
class Tag

  def self.add(text, peep_id)
    find(text).each do |tag|
      tag_id = query("INSERT INTO tags (name) VALUES('#{tag}') RETURNING id;").first[:id]
      query("INSERT INTO peep_tags (tag_id, peep_id) VALUES(#{tag_id}, #{peep_id});")
    end
  end

  def self.find(text)
    text.scan(/#\S+/)
  end

  def self.query(query_string)
    results = PG.connect(dbname: "chitter#{ENV['ENVIRONMENT']}").exec(query_string)
    results.map { |result| result.transform_keys(&:to_sym) }
  end

end