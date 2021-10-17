class Peep
  attr_reader :content, :date

  def initialize(content: nil, date: nil)
    @content = content
    @date = date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC;")
    puts "Here is my all query"
    puts result.map { |hash| hash }

    result.map do |peep| 
      Peep.new(content: peep['content'], date: peep['date_posted'])
    end

  end

  def self.create(content: )
    DatabaseConnection.query("INSERT INTO peeps(content, date_posted) VALUES ($1, $2)", [content, Date.today.to_s])
  end





end