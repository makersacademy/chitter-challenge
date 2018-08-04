require 'pg'
require 'date'

class Peep

  def self.all
    if ENV['RACK_ENV'] == 'development'
      connection = PG.connect(dbname: 'chitter')
    elsif ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    end
    result = connection.exec "TABLE peeps"
    result.map { |peep| { :name => peep['name'], :peep => peep['peep'], :time => peep['time'], :date => peep['date']} }
  end

  def self.add(name, peep_text)
    if ENV['RACK_ENV'] == 'development'
      connection = PG.connect(dbname: 'chitter')
    elsif ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    end
    connection.exec "INSERT INTO peeps (name, peep, time, date) VALUES ('#{name.gsub(/[']/,"\\\\'")}', '#{peep_text.gsub(/[']/,"\\\\'")}', '#{Time.now.strftime('%H:%M:%S')}', '#{Time.now.strftime('%Y:%m:%d')}')"
  end

end
