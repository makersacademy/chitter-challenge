require_relative './database_connection'

class Peep
  attr_reader :id, :peep, :peep_entry

  def initialize(id:, peep:, peep_entry:)
    @id = id
    @peep = peep
    @peep_entry = peep_entry
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps ORDER BY peep_entry DESC;')
    peeps.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'], peep_entry: peep['peep_entry'])
    end
  end

  def self.create(peep:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (peep, peep_entry) VALUES($1, $2) RETURNING id, peep, peep_entry;", [peep, Time.now]
      )
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], peep_entry: result[0]['peep_entry'])
  end
end


# </p># <% if message.created_at > Time.now.beginning_of_day %>
# #     <%="#{time_ago_in_words(message.created_at)} ago"%> # 3 minutes ago, less than a minute ago  
# # <% else %>
# #     <%= message.created_at.strftime("%b %d, %Y") %> # Jun 29, 2012 
# # <% end %></p