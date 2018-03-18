require_relative './database_connection'

class Peep

  attr_reader :id, :text, :time, :author

  def initialize(id, text, author, time)
    @id = id
    @text = text
    @time = time
    @author = author
  end

  def self.setup(db_connect = DatabaseConnection)
    @con = db_connect
  end

  def self.all
    sort(peepify(retrieve))
  end

  def self.add(text, author = 'anonymous')
    @con.query("INSERT INTO peeps (text, author, time) "\
    "VALUES ('#{text}', '#{author}', '#{timestring}')")
  end

  def readable_time
    "on #{time.split('-')[0..1].join('-')} at #{time.split('-')[2]}"
  end

  private_class_method

  def self.retrieve
    @con.query('SELECT * FROM peeps')
  end

  def self.peepify(rs)
    rs.map do |peep| Peep.new(peep['id'], peep['text'], \
      peep['author'], peep['time'])
    end
  end

  def self.sort(peep_array)
    peep_array.sort_by { |peep| peep.time }.reverse
  end

  def self.timestring
    Time.now.strftime("%Y-%D-%H:%M:%S")
  end
end
