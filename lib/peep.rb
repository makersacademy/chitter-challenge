require 'connect_to_db'

class Peep
    def self.all
      [
        "peep1",
        "peep2",
       ]
    end

    def self.create
      DBCconection.query  


  end