class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, Text, :length => 120
  property :time, DateTime
  # def initialize
  #   @peep
  # end
#
#   def self.all
#     if ENV['ENVIRONMENT'] == 'test'
#       connection = PG.connect(dbname: 'chitter_test')
#     else
#       connection = PG.connect(dbname: 'chitter')
#     end
#
#     result = connection.exec("SELECT * FROM peeps;")
#     result.map { |peep| peep['peep'] }
#   end
#
#   def self.add(peep:)
#     if ENV['ENVIRONMENT'] == 'test'
#       connection = PG.connect(dbname: 'chitter_test')
#     else
#       connection = PG.connect(dbname: 'chitter')
#     end
#     result = connection.exec("INSERT INTO peeps(peep) VALUES('#{peep}') RETURNING id, peep, time")
#   end
end
