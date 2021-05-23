require 'pg'
require_relative 'database_connection'
require_relative './comment.rb'

class Chirps

    attr_reader :id, :title, :chirp, :image

    def initialize(id:, title:, chirp:, image: nil)
        @id = id
        @title = title
        @chirp = chirp
        @image = image
    end

    def self.all
        result = DatabaseConnection.query("SELECT * FROM chirps")
        result.map do |chirp|
            Chirps.new(
                chirp: chirp['chirp'],
                title: chirp['title'],
                id: chirp['id'],
                image: chirp['image']
            )
        end
    end

    def self.create(chirp:, title:, image: nil)
        result = DatabaseConnection.query("INSERT INTO chirps (title, chirp, image) VALUES('#{title}', '#{chirp}', '#{image}') RETURNING id, chirp, title, image")
        Chirps.new(id: result[0]['id'], title: result[0]['title'], chirp: result[0]['chirp'], image: result[0]['image'])
    end

    def self.delete(id:)
        DatabaseConnection.query("DELETE FROM chirps WHERE id = #{id}")
    end
    
    def self.update(id:, chirp:, title:, image: nil)
        result = DatabaseConnection.query("UPDATE chirps SET chirp = '#{chirp}', title = '#{title}', image = '#{image}' WHERE id = #{id} RETURNING id, chirp, title, image;")
        Chirps.new(id: result[0]['id'], title: result[0]['title'], chirp: result[0]['chirp'], image: result[0]['image'])
    end

    def self.find(id:)
        result = DatabaseConnection.query("SELECT * FROM chirps WHERE id = #{id};")
        Chirps.new(id: result[0]['id'], title: result[0]['title'], chirp: result[0]['chirp'], image: result[0]['image'])
    end

    def comments(comment_class = Comment)
        comment_class.where(chirp_id: id)
    end

end