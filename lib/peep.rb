require_relative './database_connection'
require_relative './user'

class Peep
  attr_reader :id, :peep, :peep_entry, :user_id

  def initialize(id:, peep:, peep_entry:, user_id:)
    @id = id
    @peep = peep
    @peep_entry = peep_entry
    @user_id = user_id
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps ORDER BY peep_entry DESC;')
    peeps.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'], peep_entry: peep['peep_entry'], user_id: (peep['user_id']).to_i)
    end
  end

  def self.create(peep:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep, peep_entry, user_id) VALUES($1, $2, $3) RETURNING id, peep, peep_entry, user_id;", [peep, Time.now, user_id]
    
      )
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], peep_entry: result[0]['peep_entry'], user_id: (result[0]['user_id']).to_i)
  end
end


# </p># <% if message.created_at > Time.now.beginning_of_day %>
# #     <%="#{time_ago_in_words(message.created_at)} ago"%> # 3 minutes ago, less than a minute ago  
# # <% else %>
# #     <%= message.created_at.strftime("%b %d, %Y") %> # Jun 29, 2012 
# # <% end %></p