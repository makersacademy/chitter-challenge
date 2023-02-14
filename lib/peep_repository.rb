require_relative 'peep'

class PeepRepository
  def all
    peeps = []

    # Send the SQL query and get the result set.
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      peep = peep.new
      peep.id = record['id'].to_i
      peep.title = record['title']
      peep.content = record['content']
      peep.date_created = record['date_created']
      peep.maker_id= record['maker_id'].to_i
     
      peeps << peep
    end

    return peeps
  end
  
# def find(id)
   # sql = 'SELECT id, title, release_year, artist_id FROM albums WHERE id = $1;'
   # result_set = DatabaseConnection.exec_params(sql, [id])

   # album = Album.new
   # album.id = result_set[0]['id'].to_i
   # album.title = result_set[0]['title']
   # album.release_year = result_set[0]['release_year']
   # album.artist_id = result_set[0]['artist_id'].to_i

   # return album
 # end

  def create(album)
   sql = 'INSERT INTO peeps (content, date_created, maker_id) VALUES ($1, $2, $3);'
   # result_set = DatabaseConnection.exec_params(sql, [album.title, album.release_year, album.artist_id])

   # return album
 # end

 # def delete(id)
  #  sql = 'DELETE FROM albums WHERE id = $1;';
  #  DatabaseConnection.exec_params(sql, [id]);
  #end
end