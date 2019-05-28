require 'pg'


class Peep

    attr_reader :id, :name, :message

    def initialize(id:, name:, message:)
        @id = id 
        @name = name 
        @message = message 
    end 

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end 

        peep_list = connection.exec("SELECT * FROM peeps;")
        peep_list.map { |peep| 
            Peep.new(id:peep['id'], name: peep['name'], message: peep['message'])}
        end 

    def self.create(name:, message:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end 

        result = connection.exec("INSERT INTO peeps (name, message) VALUES('#{name}', '#{message}') RETURNING name, message;")
        Peep.new(id: result[0]['id'], name: result[0]['name'], message: result[0]['message'])
    end 
 end 
