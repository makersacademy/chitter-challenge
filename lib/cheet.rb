require_relative 'database_connection'

# def initialize(array)
#   @id = array[0].to_i
#   @url = array[1]
#   @title = array[2]
# end

# def self.all
#   result = DatabaseConnection.query('SELECT * FROM links')
#   result.map { |array| Link.new(array) }
# end
#
# def self.add(new_link, new_title)
#   error_check(new_link)
#   DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{new_link}', '#{new_title}')")
# end
