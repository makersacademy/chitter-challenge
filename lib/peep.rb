class Peep
  attr_reader :content

  def initialize(content)
    @content = content
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = DatabaseConnection.setup('chitter_test')
    else
      connection = DatabaseConnection.setup('chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map {|peep| Peep.new(peep['content'])}
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = DatabaseConnection.setup('chitter_test')
    else
      connection = DatabaseConnection.setup('chitter')
    end
    result = connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")
    Peep.new(content)
  end
end