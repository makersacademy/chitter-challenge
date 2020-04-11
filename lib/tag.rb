require_relative './db_connection'

class Tag
  attr_reader :id, :maker, :peep
  def initialize(id, maker, peep)
    @id = id
    @maker = maker
    @peep = peep
  end

  def self.create(maker_id, peep_id)
    DBConnection.connect
    result = DBConnection.run_query("INSERT INTO tags (maker_id, peep_id) VALUES (#{maker_id}, #{peep_id}) RETURNING id, maker_id, peep_id;");
    DBConnection.disconnect

    maker = Maker.find_by_id(maker_id)
    peep = Peep.find_by_id(peep_id)
    Tag.new(result[0]['id'], maker, peep)
  end

  def self.all_for_maker(id)
    DBConnection.connect
    result = DBConnection.run_query("SELECT * FROM tags WHERE maker_id = #{id}")
    DBConnection.disconnect
    
    result.map { |row| Tag.new(row['id'], Maker.find_by_id(row['maker_id']), Peep.find_by_id(row['peep_id'])) }
  end
end
