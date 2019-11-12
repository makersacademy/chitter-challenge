require 'pg'

class Chits
    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'Chitter_test')

        else 
            connection = PG.connect(dbname: 'Chitter')  
           
        end    
     result = connection.exec('SELECT * FROM messages;')
     

    result.map{ |chitter|
        puts chitter
         chitter['messages']
         }
     
    
    end
end
