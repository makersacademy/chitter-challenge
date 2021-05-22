require 'pg'
require_relative 'database_connection'
require_relative './comment.rb'

class Chirps

    attr_reader :id, :title, :chirp

    def initialize(id:, title:, chirp:)
        @id = id
        @title = title
        @chirp = chirp
    end

    def self.all
        result = DatabaseConnection.query("SELECT * FROM chirps")
        result.map do |chirp|
        Chirps.new(
            chirp: chirp['chirp'],
            title: chirp['title'],
            id: chirp['id']
        )
    end
    end

    def self.create(chirp:, title:)
        result = DatabaseConnection.query("INSERT INTO chirps (title, chirp) VALUES('#{title}', '#{chirp}') RETURNING id, chirp, title")
        Chirps.new(id: result[0]['id'], title: result[0]['title'], chirp: result[0]['chirp'])
    end

    def self.delete(id:)
        DatabaseConnection.query("DELETE FROM chirps WHERE id = #{id}")
    end
    
    def self.update(id:, chirp:, title:)
        result = DatabaseConnection.query("UPDATE chirps SET chirp = '#{chirp}', title = '#{title}' WHERE id = #{id} RETURNING id, chirp, title;")
        Chirps.new(id: result[0]['id'], title: result[0]['title'], chirp: result[0]['chirp'])
    end

    def self.find(id:)
        result = DatabaseConnection.query("SELECT * FROM chirps WHERE id = #{id};")
        Chirps.new(id: result[0]['id'], title: result[0]['title'], chirp: result[0]['chirp'])
    end

    # def comments
    #     DatabaseConnection.query("SELECT * FROM comments WHERE chirp_id = #{id};")
    # end
    def comments(comment_class = Comment)
        comment_class.where(chirp_id: id)
    end

end