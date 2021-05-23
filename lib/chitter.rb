require 'pg'
require_relative 'database_connection'
require_relative './comment.rb'

class Chitt

  attr_reader :id, :chirp

  def initialize(id:, chirp:)
    @id = id
    @chirp = chirp
    
  end

  def self.create(chirp:)
    result = DatabaseConnection.query("INSERT INTO chirps (chirp) VALUES('#{chirp}')RETURNING id, chirp;")
    Chitt.new(id: result[0]['id'], chirp: result[0]['chirp'])       
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM chirps;")
    result.map do |chirp|
      Chitt.new(
        id: chirp['id'],
        chirp: chirp['chirp']
         )
    end
  end

  def comments
    DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = #{id};")
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM chirps WHERE id = #{id};")
  end

  def self.edit(id:, chirp:)
    result = DatabaseConnection.query("UPDATE chirps SET chirp = '#{chirp}' WHERE id = #{id} RETURNING id, chirp;")
    Chitt.new(id: result[0]['id'], chirp: result[0]['chirp'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM chirps WHERE id = #{id};")
    Chitt.new(id: result[0]['id'], chirp: result[0]['chirp'])
  end
  # def self.time(chirp:)
  #   result = chirp.id
  #   conn =  if ENV['ENVIRONMENT'] == 'test'
  #             PG.connect(dbname: 'chitter_test')
  #           else
  #             PG.connect(dbname: 'chitter')
  #           end
  #   conn.exec("SHOW * FROM chirps WHERE id = #{result};")
  # end
  def comments(comment_class = Comment)
    comment_class.where(chirp_id: id)
  end
end
