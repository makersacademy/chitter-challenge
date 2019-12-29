require 'pg'

class Peep
  attr_reader :id, :content, :time, :maker_id

  def initialize(id:, content:, time:, maker_id:)
    @id = id
    @content = content
    @time = time
    @maker_id = maker_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'],
               content: peep['content'],
               time: peep['time'],
               maker_id: peep['maker_id']
               )
    end
  end

  def self.create(content:, maker_id:) 
    result = DatabaseConnection.query("INSERT INTO peeps (content, time, maker_id)
    VALUES ('#{content}', '#{Time.now}', '#{maker_id}')
    RETURNING id, content, time, maker_id;")
    Peep.new(id: result[0]['id'],
             content: result[0]['content'],
             time: result[0]['time'],
             maker_id: result[0]['maker_id']
             )
  end
end
