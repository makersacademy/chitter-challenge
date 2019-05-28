require 'pg'


class Peep

    attr_reader :id, :name, :message, :posted_at

    def initialize(id:, name:, message:, posted_at:)
        @id = id 
        @name = name 
        @message = message 
        @posted_at = posted_at
    end 

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end 

        peep_list = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
        peep_list.map { |peep| 
            Peep.new(id:peep['id'], name: peep['name'], message: peep['message'], posted_at: peep['posted_at'])}
        end 

    def self.create(name:, message:, posted_at:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end 

        result = connection.exec("INSERT INTO peeps (name, message, posted_at) VALUES('#{name}', '#{message}', '#{posted_at}') RETURNING name, message, posted_at;")
        Peep.new(id: result[0]['id'], name: result[0]['name'], message: result[0]['message'], posted_at: result[0]['posted_at'])
    end 
 end 
