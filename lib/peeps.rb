require 'pg'

class Peeps

  def self.view
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT * FROM peeps")
    p users = result.map { |user| user['legionnaire'] }
    peeps = result.map { |peep| peep['peep'] }
    join_arrays(users,peeps).reverse
  end

  def self.add(user, peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    connection.exec("INSERT INTO peeps (legionnaire, peep) VALUES('#{user}', '#{peep}')")
  end

  private
  def self.join_arrays(user_array, peep_array)
    result = []
    for n in 0...user_array.size do
      result << []
      result[n] << user_array[n]
      result[n] << peep_array[n]
    end
    result
  end
end
