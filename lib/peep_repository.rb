require_relative 'peep'
require 'rom'

class PeepRepository
  def initialize
    @rom = ROM.container(:sql, 'postgres://localhost:5432/chitter', username: 'calumwilmot', password: 'postgres') do |config|
        config.relation(:peeps) do
          schema(infer: true)
          auto_struct true
        end
      end
    @peeps = @rom.relations[:peeps]

  end

  def all
    all_peeps = @peeps.select(:content, :created_at)
    return all_peeps
  end

  def create(content)
    # https://rom-rb.org/learn/changeset/5.2/
    @peeps.changeset(:create, content: content).commit
  end
end




# require "rom"

# rom = ROM.container(:sql, 'postgres://localhost:5432/chitter', username: 'calumwilmot', password: 'postgres') do |config|
#   config.relation(:users) do
#     schema(infer: true)
#     auto_struct true
#   end
# end

# users = rom.relations[:users]

# users.changeset(:create, email: "test@test.com", password: "password").commit

# test = users.where(email: "test@test.com").one

# puts test


# def all
#     @albums = []

#     # Send the SQL query and get the result set.
#     sql = 'SELECT id, title, release_year, artist_id FROM albums;'
#     result_set = DatabaseConnection.exec_params(sql, [])
    
#     # The result set is an array of hashes.
#     # Loop through it to create a model
#     # object for each record hash.
#     result_set.each do |record|

#       # Create a new model object
#       # with the record data.
#       @album = Album.new
#       @album.id = record['id'].to_i
#       @album.title = record['title']
#       @album.release_year = record['release_year']
#       @album.artist_id = record['artist_id'].to_i


#       @albums << @album
#     end
