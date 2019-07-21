require_relative '../lib/database_connection_setup'
require_relative '../lib/database_connection'
def test_helper
# Clear the bookmarks table
DatabaseConnection.query("TRUNCATE peeps, users;")

end
