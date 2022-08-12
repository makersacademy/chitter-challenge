require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect('chitter')

peep_repository = PeepRepository.new

peep_repository.all.sort_by{|record| record.date_time}.reverse.each do |record|
  puts "#{record.content} - #{record.date_time}"
end