require 'pg'

class Peep
  def self.all
    # connection = PG.connect(dbname: 'chitter_' + ENV['RACK_ENV'])
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| {
      text: peep['text'],
      time: peep['time']
      } }.reverse
  end

  def self.create(peep)
    peep[:text].gsub!("'","''")
    # connection = PG.connect(dbname: 'chitter_' + ENV['RACK_ENV'])
    DatabaseConnection.query("INSERT INTO peeps (text, time) VALUES
                                  ('#{peep[:text]}',
                                  '#{peep[:time]}')")
  end
end
