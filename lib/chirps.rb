require 'pg'

class Chirps

    attr_reader :id, :title, :chirp

    def initialize(id:, title:, chirp:)
        @id = id
        @title = title
        @chirp = chirp
    end

    def self.all
        if ENV['RACK_ENV'] = 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("SELECT * FROM chirps")
        result.map do |chirp|
            Chirps.new(id: chirp['id'], title: chirp['title'], chirp: chirp['chirp'])
          end
    end

    def self.create(chirp:, title:)
        if ENV['RACK_ENV'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("INSERT INTO chirps (title, chirp) VALUES('#{title}', '#{chirp}') RETURNING id, chirp, title")
        Chirps.new(id: result[0]['id'], title: result[0]['title'], chirp: result[0]['chirp'])
    end

end