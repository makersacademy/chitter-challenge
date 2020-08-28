require 'pg'


class Cheep
  def self.all 
   connection = PG.connect(dbname: 'chitter')
  end
end