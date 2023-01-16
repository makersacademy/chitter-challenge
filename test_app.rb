require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository' 

DatabaseConnection.connect

repo = PeepRepository.new
all_peeps = repo.all

all_peeps.map do |peep| 
puts peep.id, peep.peep_content, peep.peep_date, peep.user_id
end







