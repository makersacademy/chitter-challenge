require 'pg'
class Chitter

  def self.all
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'Chitter_test')
      else
        connection = PG.connect(dbname: 'Chitter')
      end
    result = connection.exec("SELECT * FROM peep;")
    result.map { |peep| peep['content'] }
  end


  # def self.add(content)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'Chitter_test')
  #   else
  #     connection = PG.connect(dbname: 'Chitter')
  #   end
  #
  #  connection.exec("INSERT INTO peep (content) VALUES('#{content}')")
  # end

end
