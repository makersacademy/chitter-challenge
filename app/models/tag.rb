class Tag

  # Instance Methods
  # ==============================

  attr_reader :id, :tag

  def initialize(id:, tag:)
    @id = id
    @tag = tag
  end

  # Class Methods
  # ==============================

  def self.setup(dbconnection:)
    @database = dbconnection
  end

  def self.new_message(text, message_id)
    tags = text.scan(/(?<=#)(\w+)/)
    tags.each{|tag|
      tag_id = @database.command("INSERT INTO tags (tag) VALUES ('#{tag[0]}') ON CONFLICT (tag) DO UPDATE SET tag=EXCLUDED.tag RETURNING tag_id;")[0]['tag_id']
      @database.command("INSERT INTO tags_messages (tag_id_fkey, message_id_fkey) VALUES ('#{tag_id}', '#{message_id}')")
    }
  end

  def self.top_tags
    toptags = @database.command('SELECT tag_id_fkey, tag, COUNT (tag_id_fkey), RANK () OVER ( ORDER BY COUNT (tag_id_fkey) DESC) rank_number FROM tags_messages JOIN tags ON tags_messages.tag_id_fkey=tags.tag_id GROUP BY tag_id_fkey, tags.tag LIMIT 10;')

    toptags.map{|row| self.new(id: row['tag_id_fkey'], tag: row['tag'])}
  end
end
