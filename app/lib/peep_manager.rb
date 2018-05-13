require_relative 'database_query_manager'
require_relative 'peep'

class PeepManager

  @peep_class = Peep

  def self.display_posts
    DatabaseQueryManager.all.map{|row| @peep_class.new(row['id'], row['user_id'], row['peep'], row['timestamp']) }

  end

end
