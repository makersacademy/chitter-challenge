class Peep
  attr_reader :id, :texts

  def initialize(id, texts)
    @id = id
    @texts = texts
  end

  def self.all
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |row| peep = Peep.new(row["id"], row["texts"]) end
  end



end