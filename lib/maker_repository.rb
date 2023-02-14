class MakerRepository
  def all
    makers = []

    # Send the SQL query and get the result set.
    sql = 'SELECT * FROM makers;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|

      # Create a new model object
      # with the record data.
      maker = maker.new
      maker.id = record['id'].to_i
      maker.name = record['name']
      maker.username = record['username']
      maker.email = record['email ']
      maker.password = record['password']


      makers << maker
    end

    return makers
  end
end