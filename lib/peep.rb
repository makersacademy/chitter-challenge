require 'pg'

class Peep

  #attr_reader :id, :text, :name, :time

  #def initialize(id, text, name)
  #  @id = id
  #  @text = text
  #  @name = name
  #  @time = Time.now
  #end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| "#{Time.now.strftime '%Y-%m-%d %H:%M:%S'} #{peep['name']}: #{peep['text']}" }
  end

  def self.add(text:, name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
      connection.exec("INSERT INTO peeps (text,name) VALUES('#{text}','#{name}')")
  end

end
