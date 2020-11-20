# require 'database_connection'
#
# class User
#
#   attr_reader :id, :peep
#
#   def initialize(id:, peep:)
#     @id = id
#     @peep = peep
#   end
#
#   def self.all
#     result = DatabaseConnection.query("SELECT * FROM peeps")
#     result.map do |peep|
#       User.new(
#         id: peep['id'],
#         peep: peep['peep']
#       )
#     end
#   end
#
# end
