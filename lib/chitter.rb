require 'pg'

class Chitt

  attr_reader :id, :chirp

  def initialize(id:, chirp:)
    @id = id
    @chirp = chirp
  end

  def self.create(chirp:)
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'chitter_test')
           else
             PG.connect(dbname: 'chitter')
           end 
    result = conn.exec("INSERT INTO chirps (chirp) VALUES('#{chirp}')RETURNING id, chirp;")
    Chitt.new(id: result[0]['id'], chirp: result[0]['chirp'])       
  end

  def self.all
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'chitter_test')
           else
             PG.connect(dbname: 'chitter')
           end 
    result = conn.exec("SELECT * FROM chirps;")
    result.map do |chirp|
      Chitt.new(id: chirp['id'], chirp: chirp['chirp']) 
    end
  end

  def self.delete(id:)
    conn =  if ENV['ENVIRONMENT'] == 'test'
              PG.connect(dbname: 'chitter_test')
            else
              PG.connect(dbname: 'chitter')
            end
    conn.exec("DELETE FROM chirps WHERE id = #{id};")
  end
end
